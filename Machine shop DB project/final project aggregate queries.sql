/* Task #1 

USE machineShop;
SELECT ZipCode.City, COUNT(DISTINCT Employee.EmployeeID) AS [Employee per City]
FROM Employee JOIN ZipCode ON Employee.ZipCodeID = ZipCode.ZipCodeID
GROUP BY ZipCode.City
ORDER BY ZipCode.City ASC;

USE machineShop;
SELECT SUM(QtyRan) AS "Total qty Ran"
FROM DailyRun
WHERE RunDate BETWEEN '2021-10-02' AND '2021-10-06';

USE machineShop;
SELECT COUNT(WorkOrderID) AS [Number of Workorders], MAX(Quantity) AS [Max Qty], MIN(Quantity) AS [Min Qty],
AVG(Quantity) AS [Average Qty]
FROM WorkOrder;


USE machineShop;
SELECT MachineID, COUNT(EmployeeID) AS "Total number of Employee"
FROM DailyRun
GROUP BY MachineID
ORDER BY MachineID;*/



