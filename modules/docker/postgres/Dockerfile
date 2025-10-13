FROM postgres:16

ENV LANG=en_US.utf8 \
    LC_ALL=en_US.utf8

ENV POSTGRES_INITDB_ARGS="--auth=scram-sha-256"

COPY initdb/ /docker-entrypoint-initdb.d/

COPY ../../hogwarts-infra/modules/docker/postgres/config/postgresql.conf /etc/postgresql/postgresql.conf
COPY ../../hogwarts-infra/modules/docker/postgres/config/pg_hba.conf     /etc/postgresql/pg_hba.conf

HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD pg_isready -U "$${POSTGRES_USER:-appuser}" -d "$${POSTGRES_DB:-appdb}" || exit 1
