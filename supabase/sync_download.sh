#! /bin/bash

#set -e  # Exit on error
set -a && source ../.env && set +a

# Truncate all tables
# Truncate all tables in icp_download schema
psql "postgres://postgres.$POOLER_TENANT_ID:$POSTGRES_PASSWORD@$SERVER_IP:$POSTGRES_PORT/$POSTGRES_DB" \
  -t \
  -c "SELECT 'TRUNCATE TABLE icp_download.' || tablename || ' CASCADE;' 
      FROM pg_tables 
      WHERE schemaname = 'icp_download';" | \
while read cmd; do
  psql "postgres://postgres.$POOLER_TENANT_ID:$POSTGRES_PASSWORD@$SERVER_IP:$POSTGRES_PORT/$POSTGRES_DB" -c "$cmd"
done

psql "postgres://postgres.$POOLER_TENANT_ID:$POSTGRES_PASSWORD@$SERVER_IP:$POSTGRES_PORT/$POSTGRES_DB" -f "tmp/icp_download.sql"
