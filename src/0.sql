create table T(A text);
select sql from sqlite_master;
update sqlite_master set sql='create table T(A text, B text)';

PRAGMA writable_schema = 1;
update sqlite_master set sql='create table T(A text, B text)';
PRAGMA writable_schema = 0;

select sql from sqlite_master;
insert into T values('AAA','BBB');

