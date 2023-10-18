--1.
SELECT EmployeeID, COUNT(OrderID)
FROM Orders
GROUP BY EmployeeID

--2.
SELECT ShipVia, SUM(Freight) AS "op�ata za przesy�k�"
FROM Orders
GROUP BY ShipVia

--3.
SELECT ShipVia, SUM(Freight) AS "op�ata za przesy�k�"
FROM Orders
WHERE YEAR(ShippedDate) BETWEEN 1996 AND 1997 --mo�liwe �e trzeba r�wnie� uwzgl�dni� OrderDate
GROUP BY ShipVia