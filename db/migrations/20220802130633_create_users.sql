-- migrate:up
create table statusdog.users (
	id BIGINT primary key,
	email varchar(500) not null,
	current_challenge text null
)


