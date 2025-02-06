


## Restore a database from a dump file
```bash
pg_restore -f mydatabase.sql /Users/b-mini/Downloads/ICP_Forests_database_empty_2025-01-29.dump 
```

## Create a database
```bash
  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/read-zip' \
    -d '@/Volumes/U-Mini/fuk/icp/icpf_inspect.zip' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/zip'
```


## TODO
- [ ] Add a function to read a zip file and save it to the database