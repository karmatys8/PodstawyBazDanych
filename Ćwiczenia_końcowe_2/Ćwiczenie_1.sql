--1.
SELECT OrderID, SUM(CAST(ROUND(UnitPrice*Quantity*(1 - Discount), 2) AS MONEY)) AS OrderValue
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderValue DESC

--2.
SELECT TOP 10 OrderID, SUM(CAST(ROUND(UnitPrice*Quantity*(1 - Discount), 2) AS MONEY)) AS OrderValue
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderValue DESC