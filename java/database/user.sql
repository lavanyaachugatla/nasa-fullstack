-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER nasa_capstone_owner
WITH PASSWORD 'aliensarereal';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO nasa_capstone_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO nasa_capstone_owner;

CREATE USER nasa_capstone_appuser
WITH PASSWORD 'marsaliensnotgreen';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO nasa_capstone_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO nasa_capstone_appuser;
