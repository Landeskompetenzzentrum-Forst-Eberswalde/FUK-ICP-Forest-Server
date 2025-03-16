CREATE OR REPLACE FUNCTION public.enable_rls_for_schema(schema_name TEXT, username TEXT DEFAULT 'anon') RETURNS VOID AS $$
DECLARE
    table_record RECORD;
BEGIN
    -- Loop through all tables in the specified schema
    FOR table_record IN
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = schema_name
        AND table_type = 'BASE TABLE'
    LOOP
        -- Enable RLS for each table
        EXECUTE format('ALTER TABLE %I.%I ENABLE ROW LEVEL SECURITY', schema_name, table_record.table_name);
        EXECUTE format('ALTER TABLE %I.%I FORCE ROW LEVEL SECURITY', schema_name, table_record.table_name);
        
        -- Optionally, add a default policy (e.g., allow all access for demonstration purposes)
        -- Replace this with your actual policy requirements
        EXECUTE format('CREATE POLICY default_select_%I ON %I.%I FOR SELECT TO %I USING (true)', username, schema_name, table_record.table_name, username);
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT public.enable_rls_for_schema('icp_dictionaries', 'anon');
SELECT public.enable_rls_for_schema('icp_download', 'anon');
SELECT public.enable_rls_for_schema('icp_upload', 'anon');