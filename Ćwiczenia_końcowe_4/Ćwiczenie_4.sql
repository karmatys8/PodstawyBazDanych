--1.1.
SELECT ROUND(SUM(UnitPrice * Quantity*(1 - DisCOUNT)), 2)
+ (SELECT Freight FROM Orders WHERE Orders.Orderid = 10250)
FROM [Order Details]
WHERE OrderID = 10250

--2.1.
SELECT ROUND(SUM(UnitPrice * Quantity*(1 - DisCOUNT)), 2)
+ (SELECT Freight FROM Orders WHERE Orders.Orderid = [Order Details].OrderID), OrderID
FROM [Order Details]
GROUP BY OrderID
ORDER BY 1 DESC

--3.1.
SELECT Address, City, Region, PostalCode, Country
FROM Customers
WHERE NOT EXISTS (SELECT * FROM Orders
					WHERE YEAR(OrderDate) = 1997
					AND Orders.CustomerID = Customers.CustomerID)

--4.1.
SELECT ProductName
FROM Products
WHERE 1 < (SELECT COUNT(CustomerID)
			FROM Orders
			INNER JOIN [Order Details]
			ON Orders.OrderID = [Order Details].OrderID
			WHERE Products.ProductID = [Order Details].ProductID
			GROUP BY [Order Details].ProductID
)