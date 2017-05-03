drop table usage;
drop table device;
drop table smart_plug;
drop table account;

create table ACCOUNT (
user_name varchar2(20),
acc_type number(2),
name varchar2(50),
password varchar2(20),
email varchar2(50),
created_date date,
auth_image_url varchar2(200),
sec_question varchar2(200),
sec_answer varchar2(200),
Constraint A_PK primary key(user_name));

create table SMART_PLUG(
plug_id varchar2(15),
user_name varchar2(50),
Constraint SP_PK primary key(plug_id),
Constraint SP_FK foreign key(user_name) references account(user_name));

create table DEVICE(
device_id number unique,
plug_id varchar2(15),
description varchar2(300),
type varchar2(30),
wattage number not null,
Constraint D_PK primary key(device_id, plug_id),
Constraint D_FK foreign key(plug_id) references smart_plug(plug_id),
Constraint D_CHK check (type in('laptop', 'tv', 'desktop', 'lamp', 'entertainment system', 'charger', 'applicance'))
);

create table USAGE (
plug_id varchar2(15),
plug_name varchar2(200),
record_date timestamp,
instant_power number,
total_power number,
Constraint U_PK primary key(record_date),
Constraint U_FK foreign key(plug_id) references smart_plug(plug_id)
);