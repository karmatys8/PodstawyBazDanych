--1.
SELECT COUNT(OrderID) AS 'Total orders', CompanyName
FROM Shippers
INNER JOIN Orders
ON Orders.ShipVia = Shippers.ShipperID
WHERE YEAR(ShippedDate) = 1997
GROUP BY ShipperId, CompanyName

--2.
SELECT TOP 1 COUNT(OrderID) AS 'Total orders', CompanyName AS 'Most active shipper in 1997'
FROM Shippers
INNER JOIN Orders
ON Orders.ShipVia = Shippers.ShipperID
WHERE YEAR(ShippedDate) = 1997
GROUP BY ShipperId, CompanyName
ORDER BY 'Total orders' DESC

--3.
SELECT Firstname, Lastname, COUNT(OrderID) AS 'Total orders'
FROM Employees
INNER JOIN Orders
ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.Employeeid, Lastname, Firstname

--4.
SELECT TOP 1 Firstname, Lastname, COUNT(OrderID) AS 'Total orders'
FROM Employees
INNER JOIN Orders
ON Orders.EmployeeID = Employees.EmployeeID
WHERE YEAR(OrderDate) = 1997
GROUP BY Employees.Employeeid, Lastname, Firstname
ORDER BY 'Total orders' DESC

--5.
SELECT TOP 1 Lastname, Firstname,
ROUND(SUM(UnitPrice*Quantity*(1 - Discount)), 2) AS 'Total orders'' price'
FROM Employees
INNER JOIN Orders
ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details]
ON [Order Details].OrderID = Orders.OrderID
WHERE YEAR(OrderDate) = 1997
GROUP BY Employees.Employeeid, Lastname, Firstname
ORDER BY 'Total orders'' price' DESC