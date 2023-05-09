
	CREATE OR ALTER VIEW [v_PayrollEmployee]
	AS 
	SELECT	Payroll.PayrollID,	
			Payroll.EmployeeID, 
			Employees.FirstName,
			Employees.LastName,
			Employees.[Address],
			Employees.HireDate,
			Payroll.PayPeriodID,
			[Period].PeriodName,
			Payroll.NetPay,
			Employees.AnualSalary

	FROM	Payroll,
			Employees,
			[Period]
		
	WHERE	Payroll.EmployeeID   = Employees.EmployeeID 
	and		Payroll.PayPeriodID  = [Period].PeriodID
