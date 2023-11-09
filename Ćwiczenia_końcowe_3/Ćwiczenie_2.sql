--1.
SELECT SUM(Quantity) AS 'Total quantity', CategoryName
FROM Categories
INNER JOIN Products
ON Categories.CategoryID = Products.CategoryID
INNER JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID
GROUP BY Categories.CategoryId, CategoryName

--2.
SELECT ROUND(SUM(Quantity*[Order Details].UnitPrice*(1 - Discount)), 2) AS 'Total price', CategoryName
from Categories
INNER JOIN Products
ON Categories.CategoryID = Products.CategoryID
INNER JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID
GROUP BY Categories.CategoryId, CategoryName

--3a.
SELECT ROUND(SUM(Quantity*[Order Details].UnitPrice*(1 - Discount)), 2) AS 'Total price', CategoryName
FROM Categories
INNER JOIN Products
ON Categories.CategoryID = Products.CategoryID
INNER JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID
GROUP BY Categories.CategoryId, CategoryName
ORDER BY 'Total price'

--3b.
SELECT ROUND(SUM(Quantity*[Order Details].UnitPrice*(1 - Discount)), 2) AS 'Total price',
CategoryName, SUM(Quantity) as 'Total quantity'
FROM Categories
INNER JOIN Products
ON Categories.CategoryID = Products.CategoryID
INNER JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID
GROUP BY Categories.CategoryId, CategoryName
ORDER BY SUM(Quantity)

--4.
SELECT ROUND(SUM(Quantity*[Order Details].UnitPrice*(1 - Discount)), 2) + Freight AS 'Order price including freight'
FROM Orders
INNER JOIN [Order Details]
ON Orders.OrderId = [Order Details].OrderID
GROUP BY Orders.OrderID, Freight