-- migrate:up
create table statusdog.USERS (
	id BIGSERIAL primary key,
	email varchar(500) not null,
	current_challenge text null
)

-- migrate:down
drop table statusdog.USERS

