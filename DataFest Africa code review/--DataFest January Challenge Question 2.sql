--DataFest January Challenge Question 2

-- a. How many orders were shipped by Speedy Express in total?
SELECT 
	COUNT(O.OrderID)
FROM 
	Orders O
LEFT JOIN
	Shippers S
ON
	O.ShipperID = S.ShipperID
WHERE
	S.ShipperName = 'Speedy Express';


-- b. What is the last name of the employee with the most orders?

SELECT
	e.LastName,
    COUNT(o.OrderID)
FROM
	Orders o
LEFT JOIN
	Employees e
ON
	o.EmployeeID = e.EmployeeID
GROUP BY
	1
ORDER BY
	2 DESC
LIMIT 1;


-- c. What product was ordered the most by customers in Germany?

SELECT
	p.ProductName
FROM
	OrderDetails od
LEFT JOIN
	Products p
ON
	od.ProductID = p.ProductID
LEFT JOIN
	Orders o
ON
	od.OrderID = o.OrderID
JOIN
	Customers c
ON
	o.CustomerID = c.CustomerID
WHERE
	c.Country = 'Germany'
GROUP BY
	1
ORDER BY
	SUM(od.Quantity) DESC
LIMIT 
	1
