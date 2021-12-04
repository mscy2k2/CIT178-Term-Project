USE machineShop;
GO
CREATE INDEX idx_Zipcode ON Employee(ZipCodeID);
GO
CREATE INDEX idx_Rawpart ON FinishedParts(RawPartID);
GO
CREATE INDEX idx_Finishedpart ON WorkOrder(FinishedPartID);
GO
CREATE INDEX idx_Employee ON DailyRun(EmployeeID);
GO
CREATE INDEX idx_Workorder ON DailyRun(WorkOrderID);
GO
CREATE INDEX idx_Machine ON DailyRun(MachineID);
GO