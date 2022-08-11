-- migrate:up

create table statusdog.authenticators (
  id BIGSERIAL not null primary key,
  name varchar(100) not null,
  --- // SQL: Encode to base64url then store as `TEXT`. Index this column
  credential_id text not null,
  --- // SQL: Store raw bytes as `BYTEA`/`BLOB`/etc...
  credential_public_key bytea not null,
  --- // SQL: Consider `BIGINT` since some authenticators return atomic timestamps as counters
  counter bigint not null,
  --- // SQL: `VARCHAR(255)` and store string array as a CSV string
  transports text[],
  user_id BIGINT references statusdog.users(id) on delete cascade
)



