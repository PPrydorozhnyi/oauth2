CREATE TABLE IF NOT EXISTS oauth_client_details
(
    client_id               VARCHAR(256) PRIMARY KEY,
    resource_ids            VARCHAR(256),
    client_secret           VARCHAR(256) NOT NULL,
    scope                   VARCHAR(256),
    authorized_grant_types  VARCHAR(256),
    web_server_redirect_uri VARCHAR(256),
    authorities             VARCHAR(256),
    access_token_validity   INTEGER,
    refresh_token_validity  INTEGER,
    additional_information  VARCHAR(4000),
    autoapprove             VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS oauth_client_token
(
    token_id          VARCHAR(256),
    token             BYTEA,
    authentication_id VARCHAR(256) PRIMARY KEY,
    user_name         VARCHAR(256),
    client_id         VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS oauth_access_token
(
    token_id          VARCHAR(256),
    token             BYTEA,
    authentication_id VARCHAR(256),
    user_name         VARCHAR(256),
    client_id         VARCHAR(256),
    authentication    BYTEA,
    refresh_token     VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS oauth_refresh_token
(
    token_id       VARCHAR(256),
    token          BYTEA,
    authentication BYTEA
);

CREATE TABLE IF NOT EXISTS oauth_code
(
    code           VARCHAR(256),
    authentication BYTEA
);

CREATE TABLE IF NOT EXISTS users
(
    id       SERIAL PRIMARY KEY,
    username VARCHAR(256) NOT NULL,
    password VARCHAR(256) NOT NULL,
    enabled  SMALLINT,
    UNIQUE (username)
);

CREATE TABLE IF NOT EXISTS authorities
(
    username  VARCHAR(256) NOT NULL,
    authority VARCHAR(256) NOT NULL,
    PRIMARY KEY (username, authority)
);

-- The encrypted client_secret it `secret`
INSERT INTO oauth_client_details (client_id, client_secret, scope, authorized_grant_types, authorities,
                                  access_token_validity)
VALUES ('clientId', '{bcrypt}$2a$10$vCXMWCn7fDZWOcLnIEhmK.74dvK1Eh8ae2WrWlhr2ETPLoxQctN4.', 'read,write',
        'password,refresh_token,client_credentials', 'ROLE_CLIENT', 300);
