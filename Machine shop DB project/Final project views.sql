/* Final Project Views 

/*  View #1  */

-- updatable view --
USE machineShop;
CREATE VIEW Daily_Operation
AS
SELECT ID, WorkOrderID, MachineID, QtyRan
FROM DailyRun;


--original data--
SELECT * FROM Daily_Operation;

-- updating quantity ran --
UPDATE Daily_Operation
SET QtyRan = 152
WHERE ID=2;

-- displaying new data--
SELECT * FROM Daily_Operation;*/

/*  View #2  

-- creating view --
CREATE VIEW Raw_FinishPart
AS
SELECT RawParts.RawPartID, RawPartNo, Material, RawQty, FinishPartNo, FinishedQty
FROM RawParts JOIN FinishedParts ON RawParts.RawPartID = FinishedParts.RawPartID;

-- using the view to display the data --
SELECT * FROM Raw_FinishPart;*/

/* View #3 

-- creating view --
CREATE VIEW Scheduled_WkOrder
AS
SELECT WorkOrderID, StartDate, Quantity FROM WorkOrder
WHERE GETDATE()>StartDate AND Quantity > 0;

-- using the view to display the data --
SELECT * FROM Scheduled_WkOrder;*/

/* View #4 

-- creating view --
CREATE VIEW EmployeeContact
AS
SELECT FirstName, LastName, BirthDate FROM Employee;

-- using the view to display the data --
SELECT * FROM EmployeeContact;*/


