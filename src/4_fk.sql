pragma foreign_keys = ON;
create table T(A int, B int references U(A));
create table U(A inteter primary key);
insert into U values(1);
insert into T values(1, 2);
select A from T;

begin transaction;
pragma schema_version;
pragma writable_schema = ON;
update sqlite_master set sql='create table T(A int, B int);';
pragma schema_version = 2;
pragma writable_schema = OFF;
pragma integrity_check;
commit;

insert into T values(1, 2);
select A from T;

