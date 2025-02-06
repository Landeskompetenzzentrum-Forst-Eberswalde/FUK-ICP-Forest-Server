

# FUK ICP Forest Server

## Requirements
Make sure you have the following installed:
- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/engine/install/)
- [Supabase CLI](https://supabase.com/docs/guides/local-development/cli/getting-started)

## Getting started

```bash
# Clone the repository
git clone https://github.com/Landeskompetenzzentrum-Forst-Eberswalde/FUK-ICP-Forest-Server.git

# Copy the fake env vars
cp .env.example .env

# Pull the latest images
docker compose pull

# Start the services (in detached mode)
docker compose up -d
```

## Restore a database from a dump file

```bash
pg_restore -f mydatabase.sql /Users/b-mini/Downloads/ICP_Forests_database_empty_2025-01-29.dump 
```