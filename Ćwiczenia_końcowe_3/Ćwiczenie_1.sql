--1.
SELECT SUM(Quantity) AS 'Total quantity', CompanyName
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
GROUP BY Orders.OrderID, CompanyName

--2.
SELECT SUM(Quantity) AS 'Total quantity', CompanyName
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
GROUP BY Orders.OrderID, CompanyName
HAVING SUM(Quantity) > 250

--3.
SELECT ROUND(SUM(Quantity*UnitPrice*(1 - Discount)), 2) AS 'Total price', CompanyName
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
GROUP BY Orders.OrderID, CompanyName

--4.
SELECT ROUND(SUM(Quantity*UnitPrice*(1 - Discount)), 2) AS 'Total price', CompanyName
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
GROUP BY Orders.OrderID, CompanyName
HAVING SUM(Quantity) > 250

--5.
SELECT ROUND(SUM(Quantity*UnitPrice*(1 - Discount)), 2) AS 'Total price',
CompanyName, FirstName, LastName
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Orders.OrderID, CompanyName, LastName, FirstName
HAVING SUM(Quantity) > 250