-- Create Keycloak database and user
CREATE DATABASE keycloak;

CREATE USER keycloak WITH PASSWORD 'keycloak123';

GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;

ALTER DATABASE keycloak OWNER TO keycloak;


CREATE DATABASE hogwarts;

CREATE USER sa WITH PASSWORD 'sa123';

GRANT ALL PRIVILEGES ON DATABASE hogwarts TO sa;

ALTER DATABASE hogwarts OWNER TO sa;
