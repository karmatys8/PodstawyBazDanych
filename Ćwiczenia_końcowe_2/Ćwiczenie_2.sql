--1.
SELECT ProductID, sum(Quantity) AS TotalOrderedQuantity
FROM [Order Details]
WHERE ProductID < 3
GROUP BY ProductID

--2.
SELECT ProductID, sum(Quantity) AS TotalOrderedQuantity
FROM [Order Details]
GROUP BY ProductID

--3.
SELECT OrderID,
SUM(CAST(ROUND(UnitPrice*Quantity*(1-Discount), 2) AS MONEY)) AS OrderValue,
Sum(Quantity) AS TotalOrderedQuantity
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 250