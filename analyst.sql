create role "{{name}}"
with login password '{{password}}'
valid until '{{expiration}}' inherit;
alter default privileges in schema public;
grant select on tables  to "{{name}}";
