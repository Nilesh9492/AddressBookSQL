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

