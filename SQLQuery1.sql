--UC1--
create database AddressBook;
use AddressBook;

--UC2--
create table Address_Book_Table
(
FirstName varchar(50) not null,
LastName varchar(20),
Address varchar(100),
City varchar(50),
StateName varchar(55),
ZipCode int,
Phonenum bigint,
EmailId varchar(100)
);

--UC3--
Insert into Address_Book_Table values('Nilesh','bhamare','dhggh','fyfy','mh',456545,9874563210,'ftxf@gmail.com'),
('Mahesh','bha','gfhgfh','hg','gj',426586,9123456780,'mm@gmail.com');

--UC4--
update Address_Book_Table set EmailId='nil@gmail.com' where FirstName='Nilesh';
select * from Address_Book_Table;

--UC5--
delete from Address_Book_Table where FirstName='Mahesh' and LastName='bha';

--UC6--
Select FirstName,LastName from Address_Book_Table where City='fyfy' or StateName='mh';

Select FirstName,LastName from Address_Book_Table where City='hg';

--UC7--
Select Count(*) As Count,StateName,City from Address_Book_Table group by StateName,City;

--UC8--
select FirstName,LastName from Address_Book_Table where City='fyfy' order by FirstName;

--UC9--
alter table Address_Book_Table
add AddressBookName varchar(50),
RelationType varchar(50)

update Address_Book_Table
set AddressBookName='Friend',RelationType='Friend' where FirstName='Nilesh' 

update Address_Book_Table
set AddressBookName='Cousin',RelationType='Family' where ZipCode=456545;

--UC10--
Select count(*)as CountType, Phonenum  from Address_Book_Table group by RelationType;

--UC11--
create table Address_Book(
AddressBookID int identity(1,1) primary key,
AddressBookName varchar(100)
)

Insert into Address_Book values ('Family'),('Friend');

select * from Address_Book;

create table Contact_Person(
AddressBook_ID int,
ContactID int identity(1,1) primary key,
FirstName varchar(max),
LastName varchar(max),
Address varchar(max),
City varchar(max),
StateName varchar(max),
ZipCode BigInt,
PhoneNum BigInt,
EmailId varchar(max),
foreign key (AddressBook_ID) references Address_Book(AddressBookID));

Insert into Contact_Person values
('Nilesh','bhamare','dhggh','fyfy','mh',456545,9874563210,'ftxf@gmail.com'),
('Mahesh','bha','gfhgfh','hg','gj',426586,9123456780,'mm@gmail.com'),
('Parth','mahajan','dssf','fsf','fd',426836,9632587410,'rhgf@dff.com');


select * from Contact_Person;

create table Contact_Type
(ContactTypeID int identity(1,1) primary key,
ContactTypeName varchar(max)
)

Insert into Contact_Type values
('Family'),('Friends');
Select * from Contact_Type;

create Table Relation_Type(
ContactType_ID int,
Contact_ID int,
foreign key (ContactType_ID) references Contact_Type(ContactTypeID),
foreign key (Contact_ID) references Contact_Person(ContactID)
);

insert into Relation_Type values
(1,1),
(2,2),
(1,3),
(1,4)

Select * from Relation_Type;

select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Address_Book 
Full JOIN Contact_Person on Address_Book.AddressBookID=Contact_Person.AddressBook_ID 
Full JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
Full JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID

--UC13--
--UC6--
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.AddressBook_ID and (City='Mumbai' or StateName='mh')
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
--UC7--
select Count(*)As CountOfStateAndCity ,StateName,City
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID 
Group by StateName,City
--UC8--
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID 
INNER JOIN Relation_Type on Relation_Type.Contact_Id=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
order by(FirstName)
--UC10--
select Count(*) as NumberOfContacts,Contact_Type.ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.AddressBook_ID
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID Group by ContactTypeName


