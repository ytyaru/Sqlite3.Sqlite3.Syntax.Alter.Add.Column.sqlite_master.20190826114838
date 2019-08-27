create table T(A int check(0<A));
insert into T values(0);

begin transaction;
pragma schema_version;
pragma writable_schema = ON;
update sqlite_master set sql='create table T(A int);';
pragma schema_version = 2;
pragma writable_schema = OFF;
pragma integrity_check;
commit;

insert into T values(0);

