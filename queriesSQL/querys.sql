-- Vistas Northwind

USE northwind

---------------------------------------
---------------------------------------

-- DimProduct

SELECT * FROM Products
SELECT * FROM Categories

CREATE VIEW DimProduct AS
SELECT
	p.ProductID,
	p.SupplierID,
	p.ProductName AS Producto,
	p.UnitPrice AS UnidadPrecio,
	p.UnitsOnOrder AS UnidadesEnPedido,
	ca.CategoryName AS CategoriaProducto,
	ca.Description AS Descripcion,
	p.Discontinued AS Descontinuado
FROM Products AS p
INNER JOIN Categories AS ca
ON p.CategoryID = ca.CategoryID;

-- DimCustomers

SELECT * FROM Customers
SELECT * FROM CustomerCustomerDemo

CREATE VIEW DimCustomer AS
SELECT
	CustomerID,
	CompanyName AS Cliente,
	ContactName AS NombreCliente,
	Phone AS Telefono,
	Address AS Dirección,
	Country AS País,
	City AS Ciudad
FROM Customers

-- DimEmployees

SELECT * FROM Employees
SELECT * FROM Territories

CREATE VIEW DimEmployees AS
SELECT 
	EmployeeID,
	FirstName + ' ' + LastName AS Nombre,
	Title AS Puesto,
	BirthDate AS Nacimiento,
	HireDate AS FechaContratación,
	Address AS Dirección,
	Country AS País,
	City AS Ciudad
FROM Employees 

-- DimSuppliers

SELECT * FROM Suppliers

CREATE VIEW DimSuppliers AS
SELECT
	SupplierID,
	CompanyName AS Suplidor,
	ContactName AS Representante,
	Country AS País,
	City AS Ciudad,
	Address AS Dirección,
	Phone AS Telefono
FROM Suppliers

-- FACTSales

SELECT * FROM Orders
SELECT * FROM [Order Details]

CREATE VIEW FACTSales AS
SELECT 
	od.OrderID,
	o.CustomerID,
	o.EmployeeID,
	od.ProductID,
	od.UnitPrice AS PrecioUnidad,
	od.Quantity AS Cantidad,
	od.Discount AS Descuento,
	o.Freight AS CostoTransportación,
	o.ShipVia AS ShipperID,
	o.OrderDate AS FechaOrden,
	o.ShippedDate AS FechaEnvío,
	ROUND(Quantity * UnitPrice * (1 - Discount), 2) AS LineaTotal
FROM [Order Details] AS od
INNER JOIN Orders AS o
ON od.OrderID = o.OrderID;

-- DimShippers

SELECT * FROM Shippers

CREATE VIEW DimShippers AS 
SELECT
	ShipperID,
	CompanyName AS Transportista,
	Phone AS Telefono
FROM Shippers






SELECT * FROM Region










