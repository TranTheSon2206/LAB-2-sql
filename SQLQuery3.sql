create database BookLibrary
go
use BookLibrary
go
--Tao bang Book
create table Book(
BookCode int primary key not null,
BookTitle varchar(100) null,
Author varchar(50) not null,
Edittion int,
BookPrice money,
Copies int
)
--Tao bang member
create table Member(
Membercode int primary key not null,
Name varchar(50) not null,
Address varchar(100) not null,
PhoneNumber bigint UNIQUE
)
--Tao bang IssueDetails
create table IssueDetails(
BookCode int,
CONSTRAINT fk_book_code FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
MemberCode int,
CONSTRAINT fk_member_code FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode),
IssueDate datetime,
Returntime datetime
)
ALTER TABLE Book ADD CONSTRAINT chk_bp check (bookprice >0 and bookprice <200);

ALTER TABLE IssueDetails DROP CONSTRAINT  fk_book_code;
ALTER TABLE IssueDetails DROP CONSTRAINT fk_fk_member_code;

ALTER TABLE IssueDetails ADD CONSTRAINT pk_BookCode PRIMARY KEY (BookCode);
ALTER TABLE IssueDetails ADD CONSTRAINT pk_MemberCode PRIMARY KEY (MemberCode);

