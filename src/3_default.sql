create table T(A int default '<DEFAULT>', B int);
insert into T(B) values(0);
select A from T;

begin transaction;
pragma schema_version;
pragma writable_schema = ON;
update sqlite_master set sql='create table T(A int, B int);';
pragma schema_version = 2;
pragma writable_schema = OFF;
pragma integrity_check;
commit;

insert into T(B) values(0);
select A from T;

