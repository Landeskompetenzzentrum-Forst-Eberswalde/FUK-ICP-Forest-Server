
const fs = require('fs');
const path = require('path');
const JSZip = require('jszip');
const csv = require('csv-parser');

const zipFilePath = process.argv[2];

console.log('zipFilePath', zipFilePath);

if (!zipFilePath) {
    console.error('Error: No zip file path provided');
    process.exit(1);
}

if (!fs.existsSync(zipFilePath)) {
    console.error(`Error: File not found: ${zipFilePath}`);
    process.exit(1);
  }



const foldersToBeSortedIn = [
    {
        name: 'dictionaries',
        timestamp: 0
    },
    {
        name: 'download',
        timestamp: 0
    },
    {
        name: 'upload',
        timestamp: 0
    }
];
const foundTableNames = [];
const notFoundTableNames = [];

const createFolderIfNotExists = (folder) => {
    if (!fs.existsSync(folder)) {
        fs.mkdirSync(folder, { recursive: true });
    }
};
const extractParentZipToTemporaryFolder = async (zipFile, temporaryFolder) => {
    createFolderIfNotExists(temporaryFolder);
    clearDirectory(temporaryFolder);

    const zip = new JSZip();
    const data = fs.readFileSync(zipFile);
    const zipData = await zip.loadAsync(data);
    const fileList = [];
    await Promise.all(Object.keys(zipData.files).map(async (filename) => {
        if (!filename.endsWith('.zip')) {
            return;
        }
        const fileData = await zipData.files[filename].async('nodebuffer');
        const filePath = path.join(temporaryFolder, filename);
        fs.writeFileSync(filePath, fileData);
    }));
    return fileList;
};
const extractZipToTemporaryFolder = async (zipFile, temporaryFolder) => {

    createFolderIfNotExists(temporaryFolder);

    const zip = new JSZip();
    const data = fs.readFileSync(zipFile);
    const zipData = await zip.loadAsync(data);
    const fileList = [];
    await Promise.all(Object.keys(zipData.files).map(async (filename) => {
        if (!filename.endsWith('.sql') && !filename.endsWith('.csv')) {
            return;
        }
        const fileData = await zipData.files[filename].async('nodebuffer');
        const outputFileNameArray = filename.split('/');

        
        let parentFolderName = outputFileNameArray[outputFileNameArray.length - 2];
        parentFolderName = parentFolderName || 'download';
        
        // get the folder name is contained in foldersToBeSortedIn and outputFileNameArray
        const saveInFolder = foldersToBeSortedIn.find((folder) => folder.name === parentFolderName) || null;
        if(!saveInFolder) {
            return;
        }
        const outputFileName = filename.replace(/\//g, '-');
        const outpurDirectoryPath = path.join(temporaryFolder, saveInFolder.name);
        createFolderIfNotExists(outpurDirectoryPath);

        const filePath = path.join(outpurDirectoryPath, outputFileName);
        fs.writeFileSync(filePath, fileData);
        if(filename.endsWith('.sql')) {
            foundTableNames.push(outputFileNameArray[outputFileNameArray.length - 1].replace('.sql', ''));
        }
        fileList.push(filename);
    }));
    return fileList;
};
const clearDirectory = (directory) => {
    if (fs.existsSync(directory)) {
        fs.readdirSync(directory).forEach((file) => {
            const curPath = path.join(directory, file);
            if (fs.lstatSync(curPath).isDirectory()) {
                clearDirectory(curPath);
                // Fix: Add recursive option when removing directories
                fs.rmSync(curPath, { recursive: true });
            } else {
                fs.unlinkSync(curPath);
            }
        });
    };
};

const createOneSqlFileForEachFolder = async (inputDirectory, outputDirectory, fileCounter = 0) => {
    return new Promise((resolve, reject) => {
        createFolderIfNotExists(outputDirectory);
        
        fs.readdirSync(inputDirectory).forEach((directoryName) => {
            let sqlFileContent = 'CREATE SCHEMA IF NOT EXISTS icp_' + directoryName + ';\n\n';
            sqlFileContent += 'SET search_path TO icp_' + directoryName + ';\n\n';

            fs.readdirSync(path.join(inputDirectory, directoryName)).forEach((filename) => {
                if (filename.endsWith('.sql')) {
                    sqlFileContent += fs.readFileSync(path.join(inputDirectory, directoryName, filename), 'utf8');
                }
            });
            const timestamp = foldersToBeSortedIn.find((folder) => folder.name === directoryName).timestamp;
            //fs.appendFileSync(path.join(outputDirectory, `${timestamp}_${directoryName}.sql`), sqlFileContent);
            fs.writeFileSync(path.join(outputDirectory, `${timestamp}_${directoryName}.sql`), sqlFileContent);
        });
        resolve(fileCounter);
    });
};

const _mapToSqlColumnValue = ({ header, index, value }) => {
    if(value === '') return 'NULL';
    if(value === 'true') return 'TRUE';
    if(value === 'false') return 'FALSE';

    /// if is Date Format
    if(value.match(/^(\d{4})-(\d{2})-(\d{2})$/)) {
        return `'${value}'`;
    }

    // encode single quote
    value = value.replace(/'/g, "''");

    return isNaN(value) ? `'${value}'` : value;
};

const createSqlInsertsFromCsv = async (inputDirectory, outputDirectory, fileCounter = 0) => {
    createFolderIfNotExists(outputDirectory);

    const directories = fs.readdirSync(inputDirectory);
    for (const directoryName of directories) {
        console.log(directoryName);
        const files = fs.readdirSync(path.join(inputDirectory, directoryName));
        for (const filename of files) {
            
            let columns = null;
            if (filename.endsWith('.csv')) {
                console.log(filename);
                const tableName = filename.split('-').pop().replace('.csv', '');
                // SET SEARCH_PATH TO ALL TABLES
                //let sqlFileContent = `CREATE SCHEMA IF NOT EXISTS icp_${directoryName};\n\n`;
                //sqlFileContent += `SET search_path TO icp_${directoryName};\n\n`;

                //fs.appendFileSync(path.join(outputDirectory, `${tableName}.sql`), sqlFileContent);

                if(!foundTableNames.includes(tableName)) {
                    notFoundTableNames.push(tableName);
                    continue;
                }
                
                await new Promise((resolve, reject) => {
                    fs.createReadStream(path.join(inputDirectory, directoryName, filename))
                        .pipe(csv({ separator: ';', mapValues: _mapToSqlColumnValue }))
                        .on('data', (data) => {
                            if (!columns) {
                                columns = Object.keys(data);
                            }
                            const values = columns.map(column => `${data[column]}`).join(', ');
                            // add schema name to the table name
                            const insertStatement = `INSERT INTO icp_${directoryName}.${tableName} (${columns.join(', ')}) VALUES (${values});\n`;
                            fs.appendFileSync(path.join(outputDirectory, `${directoryName}_${tableName}.sql`), insertStatement);
                        })
                        .on('end', () => {
                            fileCounter++;
                            resolve(fileCounter);
                        })
                        .on('error', reject);
                });
            }
        };
    };
    return fileCounter;
}

clearDirectory(path.join(__dirname, 'tmp'));
async function processZipFile(parentDirectory) {
    
    let fileCounter = parseInt((new Date()).toISOString().replace(/[^0-9]/g, '').slice(0, -3));
    for (const folder of foldersToBeSortedIn) {
        folder.timestamp = fileCounter++;
    }

    clearDirectory(path.join(__dirname, '../supabase', 'migrations'));
    clearDirectory(path.join(__dirname, '../supabase', 'seeds'));

    createFolderIfNotExists(path.join(__dirname, 'tmp_zip'));

    if(!fs.existsSync(parentDirectory)) {
        console.log('parentDirectory not exists', parentDirectory);
        return;
    }else if( parentDirectory.endsWith('.zip') ){// is zip file
        await extractParentZipToTemporaryFolder(parentDirectory, path.join(__dirname, 'tmp_zip'));
    }else{ // copy to temporary folder
        const files = fs.readdirSync(parentDirectory);
        for (const file of files) {
            if (file.endsWith('.zip')) {
                fs.copyFileSync(path.join(parentDirectory, file), path.join(__dirname, 'tmp_zip', file));
            }
        }
    }

    // read all zip files in the temporary folder
    const zipFiles = fs.readdirSync(path.join(__dirname, 'tmp_zip'));
    for (const zipFile of zipFiles) {
        console.log('zipFile', zipFile);
        await extractZipToTemporaryFolder(path.join(__dirname, 'tmp_zip', zipFile), path.join(__dirname, 'tmp'))
        
        fileCounter = await createOneSqlFileForEachFolder(path.join(__dirname, 'tmp'), path.join(__dirname, '../supabase', 'migrations'), fileCounter);
        console.log(fileCounter)

        
        
        //copyAllSqlToDirectory(path.join(__dirname, 'tmp'), path.join(__dirname, 'migrations'));
        
    }
    await createSqlInsertsFromCsv(path.join(__dirname, 'tmp'), path.join(__dirname, '../supabase', 'seeds'), fileCounter);
    
    // delete the temporary folder
    fs.rmSync(path.join(__dirname, 'tmp_zip'), { recursive: true });
    fs.rmSync(path.join(__dirname, 'tmp'), { recursive: true });
    console.log('notFoundTableNames', notFoundTableNames);
}
// Run the main function
processZipFile(zipFilePath)
  .then(() => console.log('Processing complete'))
  .catch(err => console.error('Error processing zip file:', err));