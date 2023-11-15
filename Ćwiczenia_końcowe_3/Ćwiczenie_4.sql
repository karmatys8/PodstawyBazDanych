--1a.
SELECT DISTINCT Employees.Firstname, Employees.Lastname, ROUND(SUM(Quantity*UnitPrice*(1 - Discount)), 2) AS 'Total price'
FROM Employees
INNER JOIN Orders
ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Employees as subordinate
ON subordinate.ReportsTo = Employees.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
GROUP BY Employees.Lastname, Employees.Firstname, Employees.Employeeid, subordinate.EmployeeID

--1b.
SELECT Employees.Firstname, Employees.Lastname, ROUND(SUM(Quantity*UnitPrice*(1 - Discount)), 2) AS 'Total price'
FROM Employees
INNER JOIN Orders
ON Orders.EmployeeID = Employees.EmployeeID
LEFT OUTER JOIN Employees as e
ON e.ReportsTo = Employees.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
WHERE e.ReportsTo is NULL
GROUP BY Employees.Employeeid, Employees.Lastname, Employees.Firstname