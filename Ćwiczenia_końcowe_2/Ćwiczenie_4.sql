--1.
SELECT EmployeeID, YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY EmployeeId, YEAR(OrderDate), MONTH(OrderDate)

--2.
SELECT CategoryID, MAX(UnitPrice) AS MostExpensive, MIN(UnitPrice) AS TheCheapest
FROM Products
GROUP BY CategoryID