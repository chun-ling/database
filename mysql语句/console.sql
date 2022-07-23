select ename from emp;
select * from salgrade;
select job,avg(sal) from emp group by job;

create table t_student(
    no int(3),
    name varchar(32),
    sex char(1),
    age int(3),
    email varchar(255)
);
drop table t_student;
desc t_student;
drop table if exists t_student;
show tables;
insert into t_student(no,name,sex,age,email)values(1,'zhangsan','m',20,'zhangsan@123.com');

create table t_student(
          no int(3),
          name varchar(32),
          sex char(1) default 'm',
          age int(3),
          email varchar(255)
);

insert into t_student values(2,'zhangsan','w',19,'zhangsan@123.com');
select ename,format(sal,'$999,999')as sal from emp;

insert into t_user(id,name,birth) values(1,'zhangsan',str_to_date('01-10-1990','%d-%m-%Y'));
insert into t_user(id,name,birth)values(1,'lisi','2004-1-1');
select id,name,date_format(birth,'%m/%d/%Y')as birth from t_user;
select id,name,birth from t_user;

create table t_user(
    id int,
    name varchar(32),
    birth date,
    create_time datetime
);
insert into t_user(id,name,birth,create_time)values(1,'zhangsan','2004-1-1','2022-01-01-01-02-03');
insert into t_user(id,name,birth,create_time)values(2,'lisi','2005-09-21',now());
update t_user set name = 'jack',birth = '2000-9-21' where id = 2;
update t_user set create_time = now() where id = 2;
delete from t_user where id = 1;

select ename,dname from emp e join dept d on e.DEPTNO = d.DEPTNO;
insert into t_user(id,name,birth,create_time) values(1,'zs','1980-10-11',now()),(2,'ls','1900-9-9',now());
create table emp2 as select * from emp;
create table mytable as select empno,ename from emp where job = 'manager';
create table dept_bak as select * from dept;
insert into dept_bak select * from dept;

rollback;
truncate table dept_bak;
drop table dept_bak;
create table dept_bak as select * from dept;
truncate dept_bak;

create table t_vip(
    id int primary key auto_increment,
    name varchar(32),
    email varchar(255)
);
insert into t_vip(name)values('zs');

create table t_student(
    no int primary key,
    name varchar(32),
    classno int,
    classname varchar(32)
);

create table t_class(
    classno int primary key,
    classname varchar(255)
)engine = InnoDB default charset = utf8;

create table t_student(
    no int primary key auto_increment,
    name varchar(32),
    con int,
    foreign key(con) references t_class(classno)
);

insert into t_class(classno,classname)values(100,'北京市第一中学'),(101,'北京市第二中学');
insert into t_student(name,con)values('jack',100),('mike',101);
insert into t_student(name,con)values('zhangsan',102);
show create table t_class;

create table ttt(
    id int primary key ,
    name varchar(32)
)engine = MyISAM default charset = utf8;

start transaction;
insert into dept_bak(deptno, dname, loc) values(1,'12','bj');
rollback ;

start transaction ;
insert into dept_bak(deptno, dname, loc) values(1,'12','bj');
commit;

create table temp(
    name varchar(32)
);
set global transaction isolation level read uncommitted ;
read repeated serialiazed
select @@transaction_isolation;

start transaction ;
insert into temp(name)value ('zs');
rollback ;

set  wait_timeout=86400;
create index emp_ename_index on emp(ename);
drop index emp_ename_index on emp;
create index emp_ename_index on emp(ename);

explain select * from emp where ename = 'king';
explain select * from emp where ename = 'king' or ename = 'smith';

create view dept2_view as select * from dept2;
drop view dept2_view;
select * from dept2;
insert into dept2_view(deptno, dname, loc) values(50,'sales','beijing');
delete from dept2_view where deptno = 50;

create view temp_view as select ename,dname from emp join dept on emp.DEPTNO = dept.DEPTNO;
select * from temp_view

    多对多，三张表，关系表两个外键
    一对多，两张表，多的表加外键
    一对一，外键唯一











