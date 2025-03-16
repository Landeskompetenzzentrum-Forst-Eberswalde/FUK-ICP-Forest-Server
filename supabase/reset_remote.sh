#! /bin/bash

#set -e  # Exit on error
set -a && source ../.env && set +a


for file in tmp/*.sql; do
    psql "postgres://postgres.$POOLER_TENANT_ID:$POSTGRES_PASSWORD@$SERVER_IP:$POSTGRES_PORT/$POSTGRES_DB" -f $file
done;