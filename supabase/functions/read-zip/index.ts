// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import "jsr:@supabase/functions-js/edge-runtime.d.ts"


// https://supabase.com/blog/edge-functions-background-tasks-websockets
import { BlobWriter, ZipReader, ZipReaderStream } from 'https://deno.land/x/zipjs/index.js'
//import yauzl from 'npm:yauzl@2.10.0'


import { createClient } from 'jsr:@supabase/supabase-js@2'

const supabase = createClient(
  Deno.env.get('URL'),
  Deno.env.get('SERVICE_ROLE_KEY')
)

let numFilesUploaded = 0

async function processZipFile(uploadId, filepath) {
  
  const file = await Deno.open(filepath, { read: true })

  console.error('processZipFile 1', filepath)
  
  const fileInfo = await file.stat();
  console.error('fileInfo', fileInfo)
  
  const zipReader = new ZipReader(file.readable)

  let entries;
  try{
    console.error('entries', entries)
    entries = await zipReader.getEntries()
    console.error('entries', entries)
  }catch(e){
    console.error('failed to get entries', e)
    
  }
  console.error('processZipFile 4')
  try{
    await supabase.storage.createBucket(uploadId, {
      public: false,
    })
    console.error('supabase.storage.createBucket success')
  } catch(e) {
    console.error('failed to create bucket', e)
  }

  await Promise.all(
    entries.map(async (entry) => {
      // read file entry
      const blobWriter = new BlobWriter()
      const blob = await entry.getData(blobWriter)

      if (entry.directory) {
        return
      }

      // write file to Supabase Storage
      await supabase.storage.from(uploadId).upload(entry.filename, blob, {})


      numFilesUploaded += 1
      console.log('uploaded', entry.filename)
    })
  )

  await zipReader.close()
}

// you can add a `beforeunload` event listener to be notified
// when Function Worker is about to terminate.
// use this to do any logging, save states.
globalThis.addEventListener('beforeunload', (ev) => {
  console.log('function about to terminate: ', ev.detail.reason)
  console.log('number of files uploaded: ', numFilesUploaded)
})

async function writeZipFile(filepath, stream) {
  await Deno.writeFile(filepath, stream)
}

Deno.serve(async (req) => {
  const uploadId = crypto.randomUUID()

  const { error } = await supabase.storage.createBucket(uploadId, {
    public: false,
  })
  if (error) {
    console.log(error);
    return new Response('failed to create bucket', {
      status: 500,
    })
  }

  for await (const entry of await req.body.pipeThrough(new ZipReaderStream())) {
    // write file to Supabase Storage
    console.log('sdfsfd');
    const { error } = await supabase.storage
      .from(uploadId)
      .upload(entry.filename, entry.readable, {})

    console.log('uploaded', entry.filename)
  }

  return new Response(
    JSON.stringify({
      uploadId,
    }),
    {
      headers: {
        'content-type': 'application/json',
      },
    }
  )
})
/*
Deno.serve(async (req) => {
  if (req.headers.get('content-type') !== 'application/zip') {
    return new Response('file must be a zip file', {
      status: 400,
    })
  }
  

  const uploadId = crypto.randomUUID()
  await writeZipFile('/tmp/' + uploadId, req.body)

  // process zip file in a background task
  // calling EdgeRuntime.waitUntil() would ensure
  // function worker wouldn't exit until the promise is completed.
  
  try {
    EdgeRuntime.waitUntil(processZipFile(uploadId, '/tmp/' + uploadId))
  } catch (e) {
    return new Response('failed to process zip file', {
      status: 500,
    });
  }

  return new Response(
    JSON.stringify({
      uploadId,
    }),
    {
      headers: {
        'content-type': 'application/json',
      },
    }
  )
})
*/
/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/read-zip' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
