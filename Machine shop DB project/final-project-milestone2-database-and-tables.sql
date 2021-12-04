CREATE DATABASE machineShop
GO

USE machineShop;
CREATE TABLE Employee(
	EmployeeID int NOT NULL,
	LastName varchar(30) NOT NULL,
	FirstName varchar(20) NOT NULL,
	Address varchar(50) NOT NULL,
	BirthDate datetime,
	HireDate datetime,
	PhoneNo varchar(15),
	ZipCodeID varchar(10) NOT NULL,
	PRIMARY KEY(EmployeeID)
);

GO
CREATE TABLE ZipCode(
	ZipCodeID varchar(10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY(ZipCodeID)
);
GO
CREATE TABLE Machine(
	MachineID varchar(5) NOT NULL,
	MachineType varchar(10) NOT NULL,
	Operation varchar(10) NOT NULL,
	PRIMARY KEY(MachineID)
);
GO
CREATE TABLE RawParts(
	RawPartID int NOT NULL,
	RawPartNo varchar(20) NOT NULL,
	Material varchar(40) NOT NULL,
	RawQty int,
	PRIMARY KEY(RawPartID)
);
GO
CREATE TABLE FinishedParts(
	FinishedPartID int NOT NULL,
	Description varchar(50) NOT NULL,
	RawPartID int NOT NULL,
	FinishedQty int,
	FinishPartNo varchar(20) NOT NULL,
	PRIMARY KEY(FinishedPartID)
);
GO
CREATE TABLE WorkOrder(
	WorkOrderID int NOT NULL,
	FinishedPartID int NOT NULL,
	StartDate datetime,
	EndDate datetime,
	Quantity int,
	EstimatedTime time,
	PRIMARY KEY(WorkOrderID)
);
GO
CREATE TABLE DailyRun(
	ID int NOT NULL,
	RunDate datetime NOT NULL,
	EmployeeID int NOT NULL,
	WorkOrderID int NOT NULL,
	MachineID varchar(5) NOT NULL,
	QtyRan int,
	TimeTaken time,
	PRIMARY KEY(ID)
);
GO


