--1.1.
SELECT ProductName, UnitPrice, ROUND((SELECT AVG(UnitPrice)
								FROM Products
), 2), UnitPrice - ROUND((SELECT AVG(UnitPrice)
				FROM Products
), 2)
FROM Products

--2.1.
SELECT (SELECT CategoryName
		FROM Categories
		WHERE Products.CategoryID = Categories.CategoryID
), ProductName, UnitPrice, ROUND((SELECT AVG(UnitPrice)
									FROM Products AS P
									WHERE Products.CategoryID = P.CategoryID
), 2), UnitPrice - ROUND((SELECT AVG(UnitPrice)
							FROM Products AS P
							WHERE Products.CategoryID = P.CategoryID
), 2)
FROM Products