 /* Final Project Procedures 

 -- Retrieves and displays data
USE machineShop;
GO
CREATE PROC spMachine
AS
SELECT * FROM Machine
ORDER BY MachineID;
GO

EXEC spMachine;

-- Takes an input parameter
USE machineShop;
GO
CREATE PROC spGetRawpart
	@RawpartID int
AS
BEGIN
	SELECT * FROM RawParts
	WHERE RawPartID = @RawpartID;
END
GO
EXEC spGetRawpart 3

-- Takes one input parameter and returns three output parameters
USE machineShop;
GO
CREATE PROC spEmployeeContact
	@EmployeeID int,
	@FirstName nvarchar(30) OUTPUT,
	@LastName nvarchar(50) OUTPUT,
	@PhoneNumber nvarchar(30) OUTPUT 
AS
SELECT @FirstName = FirstName, @LastName = LastName, @PhoneNumber = PhoneNo
FROM Employee 
WHERE EmployeeID = @EmployeeID;
GO
-- Run the procedure
DECLARE @FirstName nvarchar(30);
DECLARE @LastName nvarchar(50);
DECLARE @Phone nvarchar(30);
EXEC spEmployeeContact 1002, @FirstName OUTPUT, @LastName OUTPUT, @Phone OUTPUT;
SELECT @FirstName AS 'First Name', @LastName AS 'Last Name', @Phone AS 'Phone Number';

-- Stored procedure that has a return value 
USE machineShop;
GO
CREATE PROC spWorkorderCount
AS
DECLARE @WorkorderCount int;
SELECT @WorkorderCount = COUNT(*)
FROM WorkOrder 
RETURN @WorkorderCount;
GO

DECLARE @WorkorderCount int;
EXEC @WorkorderCount = spWorkorderCount;
PRINT 'There are ' + CONVERT(varchar, @WorkorderCount) + ' workorders in your database';
GO*/

/* Final Project User Defined Functions 

-- creates the function
USE machineShop;
GO
CREATE FUNCTION fnFinishedID
    (@Description nvarchar(50) = '%')
    RETURNS int
BEGIN
    RETURN (SELECT FinishedPartID FROM FinishedParts WHERE Description Like @Description);
END; 

-- uses the function
GO
SELECT FinishedPartID, RawPartID, FinishedQty FROM FinishedParts 
WHERE FinishedPartID = dbo.fnFinishedID('Elbow%');

USE machineShop;
GO
CREATE FUNCTION fnFinished_parts
	(@Description nvarchar(50) = '%')
	RETURNS table
RETURN
	(SELECT * FROM FinishedParts WHERE Description Like @Description);
GO
SELECT * FROM dbo.fnFinished_parts('%M%');*/

/* Final Project Triggers 

--Create a trigger that will add deleted data from one of your tables into an archive or transaction table (you will need to create the table before creating the trigger) 

USE machineShop;
SELECT * INTO TestZipcode
FROM ZipCode;

CREATE TABLE ZipcodeArchive(
    ZipcodeId varchar(10),
    status varchar(30)
);

CREATE TRIGGER TestZipcode_DELETE ON TestZipcode
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ZipcodeID varchar(5)
    SELECT @ZipcodeID = DELETED.ZipcodeId
    FROM DELETED

    INSERT INTO ZipcodeArchive
    VALUES(@ZipcodeId, 'Deleted')
END

DELETE FROM TestZipcode WHERE ZipCodeID ='56988';

DELETE FROM TestZipcode WHERE ZipCodeID ='56989';

SELECT * FROM ZipcodeArchive;

--Create an insert trigger that adds to the archive or transaction table when a row is inserted

CREATE TRIGGER TestZipcode_INSERT ON TestZipcode
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ZipcodeID varchar(10)
    SELECT @ZipcodeID = INSERTED.ZipcodeId
    FROM INSERTED

    INSERT INTO ZipcodeArchive
    VALUES(@ZipcodeId, 'Inserted')
END

INSERT INTO TestZipcode(ZipCodeID,City,State) VALUES ('56984','Kingston','WY');
INSERT INTO TestZipcode(ZipCodeID,City,State) VALUES ('56985','Motown','TX');

SELECT * FROM ZipcodeArchive;

 --Create an update trigger that adds to the archive or transaction table when a row is modified

 CREATE TRIGGER TestZipcode_UPDATE ON TestZipcode
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ZipcodeID varchar(10)
	DECLARE @Action varchar(50)
    SELECT @ZipcodeId = INSERTED.ZipcodeId
    FROM INSERTED 

    IF UPDATE(ZipCodeID)
        SET @Action = 'Updated ID'   

    IF UPDATE(City)
        SET @Action = 'Updated City'

    IF UPDATE(State)
        SET @Action = 'Updated State'   

    INSERT INTO ZipcodeArchive
    VALUES(@ZipcodeId, @Action)
END

UPDATE TestZipcode SET ZipCodeID='56983' WHERE ZipCodeID = '56981';
UPDATE TestZipcode SET City='Victoria' WHERE ZipCodeID = '56987';
UPDATE TestZipcode SET State='NC' WHERE ZipCodeID = '56988';

SELECT * FROM ZipcodeArchive;*/