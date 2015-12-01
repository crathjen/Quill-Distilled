create schema quotes;
set schema quotes;

DROP TABLE QUOTE_TAG;
DROP TABLE USER_QUOTE_RATING;
DROP TABLE QUOTATION;
DROP TABLE QUOTE_SOURCE;
DROP TABLE USER_AUTHOR_RATING;
DROP TABLE AUTHOR_TAG;
DROP TABLE USER_INTEREST;
DROP TABLE USER_ROLE;
DROP TABLE ROLE;
DROP TABLE SUBJECT_TAG;
DROP TABLE AUTHOR;
DROP TABLE REGISTERED_USER;

Create table registered_user(
User_Name varchar(30),
Password varchar(25) not null,
First_name varchar(30),
last_name varchar(30),
email varchar(30) not null,
Trust_Factor int default 0,
registration_date timestamp default current_timestamp,
constraint pk_user primary key (user_name)
);

Create table author(
ID INT NOT null generated always as identity(start with 1),
First_Name varChar(30),
Last_Name varChar(30),
Descriptor varChar(12000),
Creating_user varChar(30),
creation_date timestamp default current_timestamp,
constraint pk_author primary key (id),

constraint fk_author2creatinguser foreign key (creating_user) references registered_user(user_name)
);

create table subject_tag(
id Int not null generated always as identity(start with 1),
Tag_text varChar(85),
Creating_user varChar(30),
creation_date timestamp default current_timestamp,
constraint pk_subject_tag primary key (id),

constraint fk_tag2creatinguser	foreign key (creating_user) references registered_user(user_name)
);

create table role (
role varChar(30),
constraint pk_role primary key(role)
);

create table user_role(
Reg_user varchar(30),
role varchar(30),
constraint pk_user_role primary key (reg_user, role),

constraint fk_user_role2user	foreign key (reg_user) references registered_user(user_name),

constraint fk_user_role2role	foreign key (role) references role(role)
);

create table user_interest(
reg_user varchar(30),
Tag_id integer,
constraint pk_user_interest primary key (reg_user, tag_id),

constraint fk_user_interest2user	foreign key (reg_user) references registered_user(user_name),

constraint fk_user_interest2tag	foreign key (tag_id) references subject_tag(id)
);

Create table author_tag(
author_id int,
tag_id int,
Creating_user varchar(30),
posting_date timestamp default current_timestamp,
constraint pk_author_tag primary key (author_id, tag_id),

constraint fk_author_tag2creatinguser	foreign key (Creating_user) references registered_user(user_name),

constraint fk_author_tag2tag	foreign key (tag_id) references subject_tag(id),

constraint fk_author_tag2author	foreign key (author_id) references author (id)
);

create table user_author_rating(
reg_user varchar(30),
author_id int,
rating smallint,
constraint pk_user_author_rating primary key (reg_user, author_id),

constraint fk_user_auth_rating2user	foreign key (reg_user) references registered_user(user_name),

constraint fk_user_auth_rating2author	foreign key (author_id) references author(id)

);

create table Quote_source(
ID int not null generated always as identity(start with 1),
Author_id int,
source_title varchar(140),
ISBN varChar(20),
Publication_year smallint,
publisher varchar (50),
language varchar(30),
Creating_user varchar(30),
creation_date Timestamp default current_timestamp,
constraint pk_qsource primary key (id),

constraint fk_source2creatinguser	foreign key (creating_user) references registered_user(user_name),

constraint fk_source2author	foreign key (author_id) references author(id)
);


Create table quotation(
ID INT NOT null generated always as identity(start with 1),
Author_id int,
Quote_Text VarChar (6000),
Q_Source int,
Posting_User VarChar(30),
Reported smallint Default 0,
Posting_Date Timestamp default current_timestamp,
constraint pk_quotation Primary Key (ID),

constraint fk_quote2postinguser	foreign key (posting_user) references registered_user(user_name),
constraint fk_quote2author	foreign key (author_id) references author(id),
constraint fk_quote2source	foreign key (Q_source) references quote_Source(id)
);

create table user_quote_rating(
reg_user varchar(30),
quote_id int,
rating smallint,
constraint pk_user_quote_rating primary key (reg_user, quote_id),

constraint pk_user_qt_r2user	foreign key (reg_user) references registered_user(user_name),

constraint pk_user_qt_r2quote	foreign key (quote_id) references quotation(id)

);

create table quote_tag(
quote_id int,
tag_id int,
creating_user varchar(30),
posting_date timestamp Default current timestamp,

constraint pk_quote_tag primary key (quote_id, tag_id),

constraint fk_quote_tag2creatinguser	foreign key (creating_user) references registered_user(user_name),

constraint fk_quote_tag2tag	foreign key (tag_id) references subject_tag(id),

constraint fk_quote_tag2quote	foreign key (quote_id) references quotation (id)
);
	






