-- migrate:up
create table statusdog.pending_registrations (
	email varchar(500) not null primary key,
	challenge text null
)

