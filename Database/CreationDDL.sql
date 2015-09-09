create schema quotes;
set schema quotes;



Create table registered_user(
User_Name varchar(30),
Password varchar(25) not null,
First_name varchar(30),
last_name varchar(30),
email varchar(30) not null,
Trust_Factor int default 0,
primary key (user_name)
);

Create table author(
ID INT NOT null generated always as identity(start with 1),
First_Name varChar(30),
Last_Name varChar(30),
Descriptor varChar(12000),
Creating_user varChar(30),
primary key (id),

	foreign key (creating_user) references registered_user(user_name)
);

create table subject_tag(
id Int not null generated always as identity(start with 1),
Tag_text varChar(85),
Creating_user varChar(30),
primary key (id),

	foreign key (creating_user) references registered_user(user_name)
);

create table role (
role varChar(30),
primary key(role)
);

create table rating(
rating smallint,
primary key (rating)
);

create table user_role(
Reg_user varchar(30),
role varchar(30),
primary key (reg_user, role),

	foreign key (reg_user) references registered_user(user_name),

	foreign key (role) references role(role)
);

create table user_interest(
reg_user varchar(30),
Tag_id integer,
primary key (reg_user, tag_id),

	foreign key (reg_user) references registered_user(user_name),

	foreign key (tag_id) references subject_tag(id)
);

Create table author_tag(
author_id int,
tag_id int,
Creating_user varchar(30),
primary key (author_id, tag_id),

	foreign key (Creating_user) references registered_user(user_name),

	foreign key (tag_id) references subject_tag(id),

	foreign key (author_id) references author (id)
);

create table user_author_rating(
reg_user varchar(30),
author_id int,
rating smallint,
primary key (reg_user, author_id),

	foreign key (reg_user) references registered_user(user_name),

	foreign key (author_id) references author(id),

	foreign key (rating) references rating (rating)
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
primary key (id),

	foreign key (creating_user) references registered_user(user_name),

	foreign key (author_id) references author(id)
);


Create table quotation(
ID INT NOT null generated always as identity(start with 1),
Author_id int,
Quote_Text VarChar (6000),
Q_Source int,
Posting_User VarChar(30),
Reported boolean Default false,
Posting_Date Timestamp,
Primary Key (ID),

	foreign key (posting_user) references registered_user(user_name),
	foreign key (author_id) references author(id),
	foreign key (Q_source) references quote_Source(id)
);

create table user_quote_rating(
reg_user varchar(30),
quote_id int,
rating smallint,
primary key (reg_user, quote_id),

	foreign key (reg_user) references registered_user(user_name),

	foreign key (quote_id) references quotation(id),

	foreign key (rating) references rating (rating)
);

create table quote_tag(
quote_id int,
tag_id int,
creating_user varchar(30),
primary key (quote_id, tag_id),

	foreign key (creating_user) references registered_user(user_name),

	foreign key (tag_id) references subject_tag(id),

	foreign key (quote_id) references quotation (id)
);
	






