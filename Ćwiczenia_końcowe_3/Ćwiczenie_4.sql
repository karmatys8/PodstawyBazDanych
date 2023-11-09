--1a.
SELECT Employees.Firstname, Employees.Lastname, COUNT(OrderID) AS 'Total orders'
FROM Employees
INNER JOIN Orders
ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Employees as e
ON e.ReportsTo = Employees.EmployeeID
GROUP BY Employees.Employeeid, Employees.Lastname, Employees.Firstname

--1b.
SELECT Employees.Firstname, Employees.Lastname, COUNT(OrderID) AS 'Total orders'
FROM Employees
INNER JOIN Orders
ON Orders.EmployeeID = Employees.EmployeeID
LEFT OUTER JOIN Employees as e
ON e.ReportsTo = Employees.EmployeeID
WHERE e.ReportsTo is NULL
GROUP BY Employees.Employeeid, Employees.Lastname, Employees.Firstname