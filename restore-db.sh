#!/bin/bash
set -e

DUMP_FILE=/docker-entrypoint-initdb.d/db_dumps/initial_dump.sql
if test -f "$DUMP_FILE"; then
    echo "$DUMP_FILE exists."
    echo "The database is being initialized"
    psql -U $POSTGRES_USER $POSTGRES_DB -c 'drop schema public cascade; create schema public; grant all on schema public to public;'
    psql -U $POSTGRES_USER $POSTGRES_DB < /docker-entrypoint-initdb.d/db_dumps/initial_dump.sql
    echo "Initialization complete"
fi
