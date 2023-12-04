--1.1.
SELECT FirstName, LastName, ROUND(SUM(UnitPrice * Quantity * (1 - Discount) + Freight), 2) AS 'Total Price'
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
GROUP BY Employees.EmployeeID, FirstName, LastName

--2.1.
SELECT TOP 1 FirstName, LastName, ROUND(SUM(UnitPrice * Quantity * (1 - Discount) + Freight), 2) AS 'Total Price'
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
WHERE YEAR(OrderDate) = 1997
GROUP BY Employees.EmployeeID, FirstName, LastName
ORDER BY 'Total Price'

--3a.1.
SELECT FirstName, LastName, ROUND(SUM(UnitPrice * Quantity * (1 - Discount) + Freight), 2) AS 'Total Price'
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
WHERE Employees.EmployeeID IN (SELECT E.ReportsTo
								FROM Employees AS E
)
GROUP BY Employees.EmployeeID, FirstName, LastName

--3b.1.
SELECT FirstName, LastName, ROUND(SUM(UnitPrice * Quantity * (1 - Discount) + Freight), 2) AS 'Total Price'
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
WHERE Employees.EmployeeID NOT IN (SELECT E.ReportsTo
								FROM Employees AS E
								WHERE E.ReportsTo IS NOT NULL
)
GROUP BY Employees.EmployeeID, FirstName, LastName

--4a.1.
SELECT FirstName, LastName, ROUND(SUM(UnitPrice * Quantity * (1 - Discount) + Freight), 2) AS 'Total Price',
(SELECT TOP 1 OrderDate
FROM Orders
WHERE Employees.EmployeeID = Orders.EmployeeID
ORDER BY OrderDate DESC
)
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
WHERE Employees.EmployeeID IN (SELECT E.ReportsTo
								FROM Employees AS E
)
GROUP BY Employees.EmployeeID, FirstName, LastName

--4b.1.
SELECT FirstName, LastName, ROUND(SUM(UnitPrice * Quantity * (1 - Discount) + Freight), 2) AS 'Total Price',
(SELECT TOP 1 OrderDate
FROM Orders
WHERE Employees.EmployeeID = Orders.EmployeeID
ORDER BY OrderDate DESC
)
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
WHERE Employees.EmployeeID NOT IN (SELECT E.ReportsTo
								FROM Employees AS E
								WHERE E.ReportsTo IS NOT NULL
)
GROUP BY Employees.EmployeeID, FirstName, LastName