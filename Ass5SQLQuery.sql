create database Assesment05Db
use Assesment05Db

create schema bank

create table bank.Customer(
CId nvarchar(50) primary key ,
CName nvarchar(50) not null,
CEmail nvarchar(50) unique not null ,
Contact nvarchar(50) unique not null ,
CPwd as (substring(CName, len(CName) - 1, 2) + Cid + substring(Contact, 1, 2)) persisted
)

create table bank.MailInfo(
MailTo nvarchar(50) ,
MailDate date,
MailMessage nvarchar(200))


select * from bank.Customer
select * from bank.MailInfo
--trigger
create trigger trgMailToCust
on bank.Customer
after insert
as
declare @id nvarchar(50)
declare @name nvarchar(50)
declare @mail nvarchar(50)
declare @contact nvarchar(50)
select @id= CId from inserted
select @name= CName from inserted
select @mail= CEmail from inserted
select @contact= Contact from inserted
insert into bank.MailInfo (MailTo, MailDate, MailMessage) values (@mail,GETDATE(),'Your net banking password is : CPwd.It is valid up to 2daysonly.Updateit.')
print 'record inserted & action captured in MailInfo Table'


insert into bank.Customer(CId,CName,CEmail,Contact) values ('1000','Ramesh','Ramesh@email.com',' 9868453325')
insert into bank.Customer(CId,CName,CEmail,Contact) values ('1002','ravi','ravi@email.com',' 6868453325')

insert into bank.Customer(CId,CName,CEmail,Contact) values ('1003','Sushanth','Sushanth@email.com','9569852456')

insert into bank.Customer(CId,CName,CEmail,Contact) values ('1004','samantha','samantha@email.com',' 6368453325')

insert into bank.Customer(CId,CName,CEmail,Contact) values ('1001','praveen','praveen@email.com',' 8968453325')

select * from bank.Customer
select * from bank.MailInfo