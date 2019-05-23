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
where userid = 'user1';
commit;

		SELECT * FROM CLEAN_USER WHERE bin =1 and IS_ADMIN=0;


INSERT INTO CLEAN_USER (userid, is_admin, passwd, email, address, lat, lon, reg_date, update_date) 
values ('admin', 1, '1234', 's@naver.com', '서울시', 0, 0, sysdate, sysdate);
INSERT INTO CLEAN_USER (userid, passwd, email, address, lat, lon, reg_date, update_date, phone, bin) 
values ('user1', '1234', 's@naver.com', '서울시', 37.1, 23.4, sysdate, sysdate, '012-3456-7890', 1);
INSERT INTO CLEAN_USER (userid, passwd, email, address, lat, lon, reg_date, update_date, phone, bin) 
values ('user2', '1234', 's@naver.com', '서울시', 38.1, 23.4, sysdate, sysdate, '012-3456-7890', 1);
INSERT INTO CLEAN_USER (userid, passwd, email, address, lat, lon, reg_date, update_date, phone, bin) 
values ('user3', '1234', 's@naver.com', '서울시', 39.1, 23.4, sysdate, sysdate, '012-3456-7890', 1);
INSERT INTO CLEAN_USER (userid, passwd, email, address, lat, lon, reg_date, update_date, phone, bin) 
values ('user4', '1234', 's@naver.com', '서울시', 40.1, 23.4, sysdate, sysdate, '012-3456-7890', 1);
INSERT INTO CLEAN_USER (userid, passwd, email, address, lat, lon, reg_date, update_date, phone, bin) 
values ('user5', '1234', 's@naver.com', '서울시', 41.1, 23.4, sysdate, sysdate, '012-3456-7890', 1);
INSERT INTO CLEAN_USER (userid, passwd, email, address, lat, lon, reg_date, update_date, phone, bin) 
values ('user6', '1234', 's@naver.com', '서울시', 42.1, 23.4, sysdate, sysdate, '012-3456-7890', 1);
commit;

select * from clean_user;
where is_admin = 0;
update (select * from clean_user where userid = 'user2') SET lat = 37.501427 ,lon = 127.040083;
rollback;

update (select * from clean_user where userid = 'user1') SET passwd = 1234;

update (select * from clean_user where bin = 1 and condition = 'collecting') set condition='waiting';
commit;

drop table garbage_collection;
CREATE TABLE garbage_collection (
  garbage_no number primary key,
  userid varchar(20) not null,
  cap number default(0),
  address varchar(100),
  empty_date date default(sysdate)
);

alter table garbage_collection
add constraint users foreign key(userid)
references clean_user(userid);



insert into garbage_collection
values(1, 'user1', 70, '',sysdate);
insert into garbage_collection
values(2, 'user1', 90, '',sysdate-1);
insert into garbage_collection
values(3, 'user1', 50, '',sysdate-2);
insert into garbage_collection
values(4, 'user1', 40, '',sysdate-3);
commit;

select * from GARBAGE_COLLECTION;
where userid = (select userid from clean_user where bin=1);

		select * from clean_user where bin = 1 and condition = 'collecting';

