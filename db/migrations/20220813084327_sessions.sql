-- migrate:up
create table statusdog.sessions (
	session_id UUID primary key not null,
	expires timestamptz not null default now() + interval '30 days',
	user_id BIGINT not null references statusdog.users(id) on delete cascade
)


