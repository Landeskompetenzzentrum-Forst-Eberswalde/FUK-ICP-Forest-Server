

# FUK ICP Forest Server

## Requirements
Make sure you have the following installed:
- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/engine/install/)
- [Supabase CLI](https://supabase.com/docs/guides/local-development/cli/getting-started)
- [Node.js](https://nodejs.org/en/download/)

## Setup

```bash
# Clone the repository
git clone https://github.com/Landeskompetenzzentrum-Forst-Eberswalde/FUK-ICP-Forest-Server.git
```

## Get ICP data from icpf.zip
```bash
# Create Migrations and Seed files
npm npm run process -- /path/to/your/icpf.zip
```

## Getting started (Local)

```bash
supabase start
```

## Getting started (Server)

```bash

# Change into the project directory
cd FUK-ICP-Forest-Server

# Copy the fake env vars
cp .env.example .env
````

Securing the environment variables is important. The `.env` file should never be committed to the repository.
[Securing your services](https://supabase.com/docs/guides/self-hosting/docker#securing-your-services)

```bash
# Change the values in the .env file to match your local setup
nano .env

# Pull the latest images
docker compose pull

# Start the services (in detached mode)
docker compose up -d
```

## Push to the server

Replace the placeholders `[your-tenant-id]` and `[POSTGRES_PASSWORD]` with your own values. You can find the values in the `.env` file.

Replace `[host]` with the IP address of the server.

```bash
supabase db push --include-all --db-url postgres://postgres.[your-tenant-id]:[POSTGRES_PASSWORD]@[host]:5432/postgres
```

## Update/Reset ICP Forest Database Structure

```bash
pg_restore -f icp-db-structure.sql /path/to/your.dump 
```
