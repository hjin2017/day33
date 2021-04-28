select *from member;
create table member(
id varchar2(20) constraint member_id_pk primary key,
email varchar2(20) constraint member_email_uk unique,
pw varchar2(20) constraint member_pw not null,
name varchar2(30)constraint member_name_uk unique
);

insert into member values('gjwlsgh1230','hin2015@gmail.com','4044@qfjnt','마스터');

create table board(
seq number(5) constraint board_seq_pk primary key,
title varchar2(200)constraint board_title_nn null,
contents varchar2(4000),
writer varchar2(30) constraint board_writer_fk references member(name),
time date default sysdate,
viewcount number(5),
likecount number(5),
hatecount number(5)
);

create table account(
name varchar2(30) constraint account_writer_fk references member(name),
monster_name varchar2(30),
monster_brood varchar2(30),
imag varchar2(30),
lv number(5),
job varchar2(30),
gold number(5),
power number(5),
agility number(5),
intellect number(5),
hp number(5),
mp number(5),
item varchar2(50),
bag varchar2(100)
);

 create sequence board_seq;
 