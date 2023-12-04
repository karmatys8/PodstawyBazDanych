--1.1. assuming that Orders have only one instance of a certain product
SELECT ProductName, MAX(Quantity)
FROM Products
INNER JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID
GROUP BY ProductName

--1.2.
SELECT ProductName, (SELECT TOP 1 Quantity
					FROM [Order Details]
					WHERE Products.ProductID = [Order Details].ProductID
					ORDER BY Quantity DESC)
FROM Products

--2.1.
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice < (SELECT AVG(UnitPrice)
					FROM Products
)

--3.1.
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice < (SELECT AVG(UnitPrice)
					FROM Products as P
					WHERE Products.CategoryID = P.CategoryID
)

