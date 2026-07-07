create database SUIET;
use SUIET;
create table Student(
					ID int,
                    Name varchar(30),
                    age int,
                    course varchar(30),
                    city varchar(30)
                    );

----- to add new column
alter table student add email varchar(51);

----- to modify a column
alter table student modify name varchar (50);

----- rename a column
alter table student rename column city to location ;

----- drop a column
alter table student drop column email;

----- rename
rename table student to students;

----- dml commands
----- insert
insert INTO student values (101,"Ammu",20,"DS","KOCHI");
----- (102,"ANU",21,"DA","KOZHIKODE"),
----- (103,"APPU",20,"PYTHON","KANNUR"),
----- (104,"ADARSH",22,"DS","KOCHI"); 

----- DQL = select\
select * from student;


----- delete
delete from students where ID = 104;

set sql_safe_updates=0;

----- update 
update students set course = "Data Scinece" where id = 101;





