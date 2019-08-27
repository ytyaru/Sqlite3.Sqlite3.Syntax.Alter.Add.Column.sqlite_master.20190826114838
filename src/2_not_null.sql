create table T(A int not null);
insert into T values(NULL);

begin transaction;
pragma schema_version;
pragma writable_schema = ON;
update sqlite_master set sql='create table T(A int);';
pragma schema_version = 2;
pragma writable_schema = OFF;
pragma integrity_check;
commit;

insert into T values(NULL);

