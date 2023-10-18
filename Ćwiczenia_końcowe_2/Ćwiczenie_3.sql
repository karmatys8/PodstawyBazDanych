--1.
SELECT EmployeeID, COUNT(OrderID)
FROM Orders
GROUP BY EmployeeID

--2.
SELECT ShipVia, SUM(Freight) AS "op³ata za przesy³kê"
FROM Orders
GROUP BY ShipVia

--3.
SELECT ShipVia, SUM(Freight) AS "op³ata za przesy³kê"
FROM Orders
WHERE YEAR(ShippedDate) BETWEEN 1996 AND 1997 --mo¿liwe ¿e trzeba równie¿ uwzglêdniæ OrderDate
GROUP BY ShipVia