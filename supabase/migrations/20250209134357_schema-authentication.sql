ALTER SCHEMA icp_dictionaries OWNER TO postgres;
COMMENT ON SCHEMA icp_dictionaries IS 'icp_dictionaries';
GRANT USAGE ON SCHEMA icp_dictionaries TO anon, authenticated, service_role;
GRANT ALL ON ALL TABLES IN SCHEMA icp_dictionaries TO anon, authenticated, service_role;
GRANT ALL ON ALL ROUTINES IN SCHEMA icp_dictionaries TO anon, authenticated, service_role;
GRANT ALL ON ALL SEQUENCES IN SCHEMA icp_dictionaries TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_dictionaries GRANT ALL ON TABLES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_dictionaries GRANT ALL ON ROUTINES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_dictionaries GRANT ALL ON SEQUENCES TO anon, authenticated, service_role;

ALTER SCHEMA icp_download OWNER TO postgres;
COMMENT ON SCHEMA icp_download IS 'icp_download';
GRANT USAGE ON SCHEMA icp_download TO anon, authenticated, service_role;
GRANT ALL ON ALL TABLES IN SCHEMA icp_download TO anon, authenticated, service_role;
GRANT ALL ON ALL ROUTINES IN SCHEMA icp_download TO anon, authenticated, service_role;
GRANT ALL ON ALL SEQUENCES IN SCHEMA icp_download TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_download GRANT ALL ON TABLES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_download GRANT ALL ON ROUTINES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_download GRANT ALL ON SEQUENCES TO anon, authenticated, service_role;

ALTER SCHEMA icp_upload OWNER TO postgres;
COMMENT ON SCHEMA icp_upload IS 'icp_upload';
GRANT USAGE ON SCHEMA icp_upload TO anon, authenticated, service_role;
GRANT ALL ON ALL TABLES IN SCHEMA icp_upload TO anon, authenticated, service_role;
GRANT ALL ON ALL ROUTINES IN SCHEMA icp_upload TO anon, authenticated, service_role;
GRANT ALL ON ALL SEQUENCES IN SCHEMA icp_upload TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_upload GRANT ALL ON TABLES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_upload GRANT ALL ON ROUTINES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_upload GRANT ALL ON SEQUENCES TO anon, authenticated, service_role;