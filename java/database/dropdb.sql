-- **************************************************************
-- This script destroys the database and associated users
-- **************************************************************

-- The following line terminates any active connections to the database so that it can be destroyed
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'nasa_capstone';

DROP DATABASE nasa_capstone;

DROP USER nasa_capstone_owner;
DROP USER nasa_capstone_appuser;
