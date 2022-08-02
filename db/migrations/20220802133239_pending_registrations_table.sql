-- migrate:up
create table statusdog.pending_registrations (
  id BIGINT primary key,
	email varchar(500) not null,
	challenge text null
)

