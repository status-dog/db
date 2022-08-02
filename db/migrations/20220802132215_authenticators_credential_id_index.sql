-- migrate:up

create index credential_ids on statusdog.authenticators (credential_id)


