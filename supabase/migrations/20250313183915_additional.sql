SET default_transaction_read_only = OFF;

-- SCHEMA icp_resubmission
CREATE SCHEMA icp_resubmission;
ALTER SCHEMA icp_resubmission OWNER TO postgres;
COMMENT ON SCHEMA icp_resubmission IS 'ICP Resubmission';
GRANT USAGE ON SCHEMA icp_resubmission TO anon, authenticated, service_role;
GRANT ALL ON ALL TABLES IN SCHEMA icp_resubmission TO anon, authenticated, service_role;
GRANT ALL ON ALL ROUTINES IN SCHEMA icp_resubmission TO anon, authenticated, service_role;
GRANT ALL ON ALL SEQUENCES IN SCHEMA icp_resubmission TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_resubmission GRANT ALL ON TABLES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_resubmission GRANT ALL ON ROUTINES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA icp_resubmission GRANT ALL ON SEQUENCES TO anon, authenticated, service_role;


SET search_path TO icp_resubmission;


-- SCHEMA fuk
CREATE SCHEMA fuk;
ALTER SCHEMA fuk OWNER TO postgres;
COMMENT ON SCHEMA fuk IS 'Forstliche Umweltkontrolle';
GRANT USAGE ON SCHEMA fuk TO anon, authenticated, service_role;
GRANT ALL ON ALL TABLES IN SCHEMA fuk TO anon, authenticated, service_role;
GRANT ALL ON ALL ROUTINES IN SCHEMA fuk TO anon, authenticated, service_role;
GRANT ALL ON ALL SEQUENCES IN SCHEMA fuk TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA fuk GRANT ALL ON TABLES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA fuk GRANT ALL ON ROUTINES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA fuk GRANT ALL ON SEQUENCES TO anon, authenticated, service_role;

GRANT SELECT ON tmp TO anon;
SET search_path TO fuk;