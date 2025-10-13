FROM postgres:16

ENV LANG=en_US.utf8 \
    LC_ALL=en_US.utf8

ENV POSTGRES_INITDB_ARGS="--auth=scram-sha-256"

COPY config/postgresql.conf /etc/postgresql/postgresql.conf
COPY config/pg_hba.conf     /etc/postgresql/pg_hba.conf
