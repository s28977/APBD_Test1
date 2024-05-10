-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-05-10 09:21:43.43

-- tables
-- Table: Employee
CREATE TABLE Employee (
    Id int  NOT NULL IDENTITY,
    Fullname varchar(200)  NOT NULL,
    Email varchar(200)  NOT NULL,
    CONSTRAINT Employee_ak_1 UNIQUE (Email),
    CONSTRAINT Employee_pk PRIMARY KEY  (Id)
);

-- Table: Products
CREATE TABLE Products (
    Id int  NOT NULL IDENTITY,
    Name varchar(200)  NOT NULL,
    CONSTRAINT Products_ak_1 UNIQUE (Name),
    CONSTRAINT Products_pk PRIMARY KEY  (Id)
);

-- Table: Transactions
CREATE TABLE Transactions (
    Id int  NOT NULL IDENTITY,
    EmployeeId int  NOT NULL,
    ProductsId int  NOT NULL,
    Count int  NOT NULL,
    CONSTRAINT Transactions_pk PRIMARY KEY  (Id)
);

-- foreign keys
-- Reference: Transactions_Employee (table: Transactions)
ALTER TABLE Transactions ADD CONSTRAINT Transactions_Employee
    FOREIGN KEY (EmployeeId)
    REFERENCES Employee (Id);

-- Reference: Transactions_Products (table: Transactions)
ALTER TABLE Transactions ADD CONSTRAINT Transactions_Products
    FOREIGN KEY (ProductsId)
    REFERENCES Products (Id);

insert into Employee (Fullname, Email) values ('Paul Grant', 'paul.grant@hotmail.com');
insert into Products (Name) values ('PURINA FELIX Fantastic');
insert into Transactions (EmployeeId, ProductsId, Count) values (1, 1, 8);

-- End of file.

