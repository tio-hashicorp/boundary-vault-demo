create role "{{name}}" with login password '{{password}}' ;
grant usage on schema public to "{{name}}";
grant select on all tables in schema public to "{{name}}";
