drop table clean_user;
CREATE TABLE clean_user (
  userid varchar(20) not null primary key,
  is_admin number default(0),
  passwd varchar(20) not null,
  email varchar(30) not null,
  address varchar(100),
  ip varchar(30),
  bin number default(0),
  cap number default(0),
  lat number default(0.0),
  lon number default(0.0),
  phone varchar(30),
  condition varchar(30) default('waiting'),
  REG_DATE DATE DEFAULT(SYSDATE),
  UPDATE_DATE DATE DEFAULT(SYSDATE)
);

delete from clean_user
where userid = 'admin';


INSERT INTO CLEAN_USER (userid, is_admin, passwd, email, address, lat, lon, reg_date, update_date) 
values ('admin', 1, '1234', 's@naver.com', '서울시', 0, 0, sysdate, sysdate);
INSERT INTO CLEAN_USER (userid, passwd, email, address, lat, lon, reg_date, update_date) 
values ('user1', '1234', 's@naver.com', '서울시', 37.1, 23.4, sysdate, sysdate);
select * from clean_user;
update (select * from clean_user where bin = 1 and condition = 'collecting') set condition='waiting';
commit;

drop table garbage_collection;
CREATE TABLE garbage_collection (
  garbage_no number primary key,
  userid varchar(20) not null,
  cap number default(0),
  empty_date date default(sysdate)
);

insert into garbage_collection
values(1, 'user1', 70, sysdate);
insert into garbage_collection
values(2, 'user1', 90, sysdate-1);
insert into garbage_collection
values(3, 'user1', 50, sysdate-2);
insert into garbage_collection
values(4, 'user1', 40, sysdate-3);

select * from GARBAGE_COLLECTION;


