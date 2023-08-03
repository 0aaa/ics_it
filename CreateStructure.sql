use ics_it

if object_id('dbo.SKU', 'U') is not null
	drop table dbo.SKU
if object_id('dbo.Family', 'U') is not null
	drop table dbo.Family
if object_id('dbo.Basket', 'U') is not null
	drop table dbo.basket
create table SKU
(
	ID int identity(1, 1) not null primary key,
	Code as ID + 's' unique,
	Name varchar(255)
)
create table Family
(
	ID int identity(1, 1) not null primary key,
	SurName varchar(255),
	BudgetValue money
)
create table Basket
(
	ID int identity(1, 1) not null primary key,
	ID_SKU int foreign key references SKU(ID),
	ID_FAMILY int foreign key references Family(ID),
	Quantity int not null check(Quantity >= 0),
	Value int not null check(Value >= 0),
	PurchaseDate date default getDate(),
	DiscountValue int
)