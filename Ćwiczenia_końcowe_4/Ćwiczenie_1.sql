-- 1.1.
SELECT DISTINCT Customers.CompanyName, Customers.Phone
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Shippers
ON ShipperID = ShipVia
WHERE YEAR(ShippedDate) = 1997 AND Shippers.CompanyName = 'United Package'

--1.2.
SELECT Customers.CompanyName, Customers.Phone
FROM Customers
WHERE CustomerID IN (SELECT CustomerID
					FROM Orders
					WHERE YEAR(ShippedDate) = 1997 AND
					ShipVia IN (SELECT ShipperID
								FROM Shippers
								WHERE CompanyName = 'United Package'
								)
					)

--1.3.
SELECT Customers.CompanyName, Customers.Phone
FROM Customers
WHERE EXISTS (SELECT *
					FROM Orders
					WHERE YEAR(ShippedDate) = 1997 AND Customers.CustomerID = Orders.CustomerID AND
					ShipVia = (SELECT ShipperID
								FROM Shippers
								WHERE CompanyName = 'United Package'
								)
					)

--2.1.
SELECT DISTINCT Customers.CompanyName, Customers.Phone
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products
ON [Order Details].ProductID = Products.ProductID
INNER JOIN Categories
ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName = 'Confections'
GROUP BY Customers.CustomerID, Customers.CompanyName, Customers.Phone

--2.2.
SELECT DISTINCT Customers.CompanyName, Customers.Phone
FROM Customers
WHERE CustomerID IN (SELECT CustomerID
		FROM Orders
		WHERE OrderID IN (SELECT OrderID
						FROM [Order Details]
						WHERE ProductID IN (SELECT ProductID
										FROM Products
										WHERE CategoryID IN (SELECT CategoryID
														FROM Categories
														WHERE CategoryName = 'Confections'
										)
						)
		)
)

--2.3.
SELECT DISTINCT Customers.CompanyName, Customers.Phone
FROM Customers
WHERE EXISTS (SELECT CustomerID
				FROM Orders
				WHERE Customers.CustomerID = Orders.CustomerID AND
				EXISTS (SELECT OrderID
						FROM [Order Details]
						WHERE Orders.OrderID = [Order Details].OrderID AND
						EXISTS (SELECT ProductID
								FROM Products
								WHERE [Order Details].ProductID = Products.ProductID AND
								EXISTS (SELECT CategoryID
										FROM Categories
										WHERE Products.CategoryID = Categories.CategoryID AND CategoryName = 'Confections'
								)
						)
				)
)

--3.1.
SELECT DISTINCT Customers.CompanyName, Customers.Phone
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID
		FROM Orders
		WHERE OrderID IN (SELECT OrderID
						FROM [Order Details]
						WHERE ProductID IN (SELECT ProductID
										FROM Products
										WHERE CategoryID IN (SELECT CategoryID
														FROM Categories
														WHERE CategoryName = 'Confections'
										)
						)
		)
)

--3.2.
SELECT DISTINCT Customers.CompanyName, Customers.Phone
FROM Customers
WHERE NOT EXISTS (SELECT CustomerID
				FROM Orders
				WHERE Customers.CustomerID = Orders.CustomerID AND
				EXISTS (SELECT OrderID
						FROM [Order Details]
						WHERE Orders.OrderID = [Order Details].OrderID AND
						EXISTS (SELECT ProductID
								FROM Products
								WHERE [Order Details].ProductID = Products.ProductID AND
								EXISTS (SELECT CategoryID
										FROM Categories
										WHERE Products.CategoryID = Categories.CategoryID AND CategoryName = 'Confections'
								)
						)
				)
)