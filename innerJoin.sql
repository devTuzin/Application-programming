-- 1. liste o nome do produto, o nome do fornecedor e o país do fornecedor para todos os produtos da categoria 2.
SELECT p.ProductName, s.SupplierName, sa.Country
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN SupplierAddress sa ON s.SupplierAddressID = sa.SupplierAddressID
WHERE p.CategoryID = 2;

-- 2. exiba o id do pedido, a data do pedido e o nome da transportadora responsável por cada entrega.
SELECT o.OrderID, o.OrderDate, sh.ShipperName
FROM Orders o
INNER JOIN Shippers sh ON o.ShipperID = sh.ShipperID;

-- 3. mostre o nome do produto e o nome da cidade do fornecedor para produtos que custam mais de 50.
SELECT p.ProductName, sa.City
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN SupplierAddress sa ON s.SupplierAddressID = sa.SupplierAddressID
WHERE p.Price > 50;

-- 4. relacione todos os pedidos mostrando o id e a transportadora, filtrando apenas 'correios sedex'.
SELECT o.OrderID, sh.ShipperName
FROM Orders o
INNER JOIN Shippers sh ON o.ShipperID = sh.ShipperID
WHERE sh.ShipperName = 'Correios Sedex';

-- 5. liste os produtos e seus fornecedores, apenas fornecedores do brasil ou usa.
SELECT p.ProductName, s.SupplierName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN SupplierAddress sa ON s.SupplierAddressID = sa.SupplierAddressID
WHERE sa.Country IN ('Brasil', 'USA');

-- 6. relatório com id do pedido, data e telefone da transportadora para pedidos de 2026.
SELECT o.OrderID, o.OrderDate, sh.Phone
FROM Orders o
INNER JOIN Shippers sh ON o.ShipperID = sh.ShipperID
WHERE YEAR(o.OrderDate) = 2026;

-- 7. nome do fornecedor e produto com preço entre 10 e 20.
SELECT s.SupplierName, p.ProductName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.Price BETWEEN 10 AND 20;

-- 8. liste todos os pedidos e transportadoras ordenado pelo nome da transportadora.
SELECT o.OrderID, sh.ShipperName
FROM Orders o
INNER JOIN Shippers sh ON o.ShipperID = sh.ShipperID
ORDER BY sh.ShipperName ASC;

-- 9. liste todos os fornecedores e os nomes de seus produtos.
SELECT Suppliers.SupplierName, Products.ProductName
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID;

-- 10. exiba o nome de todas as transportadoras e a quantidade de pedidos que cada uma realizou.
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS TotalPedidos
FROM Shippers
LEFT JOIN Orders ON Shippers.ShipperID = Orders.ShipperID
GROUP BY Shippers.ShipperName;

-- 11. liste todos os produtos e seus respectivos fornecedores.
SELECT Products.ProductName, Suppliers.SupplierName
FROM Products
RIGHT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

-- 12. mostre o nome de todos os fornecedores e os nomes dos produtos filtrando germany.
SELECT Suppliers.SupplierName, Products.ProductName
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE Suppliers.Country = 'Germany';

-- 13. relacione todas as transportadoras com os pedidos realizados.
SELECT Shippers.ShipperName, Orders.OrderID
FROM Orders
RIGHT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID;

-- 14. liste o nome do produto, o nome do fornecedor e o nome da transportadora para um pedido específico.
SELECT p.ProductName, s.SupplierName, sh.ShipperName
FROM orders o
INNER JOIN orderdetail od ON o.OrderID = od.OrderID
INNER JOIN products p ON od.ProductID = p.ProductID
INNER JOIN suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN shippers sh ON o.ShipperID = sh.ShipperID
WHERE o.OrderID = 1;

-- 15. exiba o nome do fornecedor, a cidade do fornecedor e a data do pedido para produtos entregues por uma transportadora específica.
SELECT s.SupplierName, sa.City, o.OrderDate
FROM orders o
INNER JOIN orderdetail od ON o.OrderID = od.OrderID
INNER JOIN products p ON od.ProductID = p.ProductID
INNER JOIN suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN supplieraddress sa ON s.SupplierAddressID = sa.SupplierAddressID
INNER JOIN shippers sh ON o.ShipperID = sh.ShipperID
WHERE sh.ShipperName = 'Correios Sedex';

-- 16. mostre quais fornecedores têm produtos que nunca foram associados a um pedido.
SELECT s.SupplierName
FROM suppliers s
LEFT JOIN products p ON s.SupplierID = p.SupplierID
LEFT JOIN orderdetail od ON p.ProductID = od.ProductID
WHERE od.OrderID IS NULL;

-- 17. liste o nome do contato do fornecedor e o nome do produto para categorias específicas e país uk.
SELECT s.ContactName, p.ProductName
FROM products p
INNER JOIN suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN supplieraddress sa ON s.SupplierAddressID = sa.SupplierAddressID
WHERE p.CategoryID IN (1, 3, 5)
AND sa.Country = 'UK';

-- 18. encontre a quantidade de pedidos por fornecedor.
SELECT s.SupplierName, COUNT(o.OrderID) AS TotalPedidos
FROM suppliers s
INNER JOIN products p ON s.SupplierID = p.SupplierID
INNER JOIN orderdetail od ON p.ProductID = od.ProductID
INNER JOIN orders o ON od.OrderID = o.OrderID
GROUP BY s.SupplierName;

-- 19. mostre produtos, categorias e fornecedores com preço acima da média.
SELECT p.ProductName, c.CategoryName, s.SupplierName
FROM products p
INNER JOIN categories c ON p.CategoryID = c.CategoryID
INNER JOIN suppliers s ON p.SupplierID = s.SupplierID
WHERE p.Price > (SELECT AVG(Price) FROM products);

-- 20. liste todos os pedidos com fornecedor e transportadora.
SELECT o.OrderID, s.SupplierName, sh.ShipperName
FROM orders o
INNER JOIN orderdetail od ON o.OrderID = od.OrderID
INNER JOIN products p ON od.ProductID = p.ProductID
INNER JOIN suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN shippers sh ON o.ShipperID = sh.ShipperID
ORDER BY o.OrderID;