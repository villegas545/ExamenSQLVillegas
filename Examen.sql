create table Cajeros(
Cajero int,
NomApels varchar(255),
primary key(Cajero)
);
create table Productos(
    Producto int,
    Nombre varchar(100),
    Precio money,
    primary key(Producto)
);

create table Maquinas_Registradoras(
    Maquina int,
    Piso int,
    primary key(Maquina)
);
create table Venta(
    Cajero int,
    Maquina int,
    Producto int,
    foreign key(Cajero) references Cajeros(Cajero),
    foreign key(Producto) references Productos(Producto),
    foreign key(Maquina) references Maquinas_Registradoras(Maquina)
);

insert into Cajeros values(1,'Juan'),(2,'Pedro'),(3,'Luis'),(4,'Maria'),(5,'Carlos'),(6,'Juan'),(7,'Pedro'),(8,'Luis'),(9,'Maria'),(10,'Carlos');
insert into Productos values(1,'Coca-Cola',1.5),(2,'Fanta',1.5),(3,'Sprite',1.5),(4,'Pepsi',1.5),(5,'Coca-Cola',1.5),(6,'Fanta',1.5),(7,'Sprite',1.5),(8,'Pepsi',1.5),(9,'Coca-Cola',1.5),(10,'Fanta',1.5),(11,'Sprite',1.5),(12,'Pepsi',1.5),(13,'Coca-Cola',1.5),(14,'Fanta',1.5),(15,'Sprite',1.5),(16,'Pepsi',1.5),(17,'Coca-Cola',1.5),(18,'Fanta',1.5),(19,'Sprite',1.5),(20,'Pepsi',1.5),(21,'Coca-Cola',1.5),(22,'Fanta',1.5),(23,'Sprite',1.5),(24,'Pepsi',1.5),(25,'Coca-Cola',1.5),(26,'Fanta',1.5),(27,'Sprite',1.5),(28,'Pepsi',1.5),(29,'Coca-Cola',1.5),(30,'Fanta',1.5),(31,'Sprite',1.5),(32,'Pepsi',1.5),(33,'Coca-Cola',1.5),(34,'Fanta',1.5),(35,'Sprite',1.5),(36,'Pepsi',1.5),(37,'Coca-Cola',1.5),(38,'Fanta',1.5),(39,'Sprite',1.5),(40,'Pepsi',1.5),(41,'Coca-Cola',1.5),(42,'Fanta',1.5),(43,'Sprite',1.5),(44,'Pepsi',1.5),(45,'Coca-Cola',1.5),(46,'Fanta',1.5),(47,'Sprite',2.8);
insert into Maquinas_Registradoras values(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1);
insert into Venta values(1,1,1),(1,1,2),(1,1,3),(1,1,4),(1,1,5),(1,1,6),(1,1,7),(1,1,8),(1,1,9),(1,1,10);


SELECT count(Venta.Producto) AS Total_Vendidos,Productos.Nombre FROM Venta INNER JOIN Productos ON Venta.Producto=Productos.Producto GROUP BY Productos.Nombre ORDER BY COUNT(Venta.Producto) DESC;
SELECT Cajeros.NomApels AS Nombre_Cajero, Productos.nombre AS Articulo, Productos.precio,Maquinas_Registradoras.Piso FROM Venta INNER JOIN Cajeros ON Venta.Cajero=Cajeros.Cajero INNER JOIN Productos ON Venta.Producto=Productos.Producto INNER JOIN Maquinas_Registradoras ON Venta.Maquina=Maquinas_Registradoras.Maquina;
SELECT SUM(Productos.Precio),Maquinas_Registradoras.Piso FROM Venta INNER JOIN Maquinas_Registradoras ON Venta.Maquina=Maquinas_Registradoras.Maquina INNER JOIN Productos ON Venta.Producto=Productos.Producto GROUP BY Maquinas_Registradoras.Piso
SELECT SUM(Productos.Precio),Cajeros.Cajero,Cajeros.NomApels FROM Venta INNER JOIN Cajeros ON Venta.Cajero=Cajeros.Cajero INNER JOIN Productos ON Venta.Producto=Productos.Producto GROUP BY Cajeros.Cajero
SELECT SUM(Productos.Precio),Maquinas_Registradoras.Piso,Productos.Producto FROM Venta INNER JOIN Maquinas_Registradoras ON Venta.Maquina=Maquinas_Registradoras.Maquina INNER JOIN Productos ON Venta.Producto=Productos.Producto GROUP BY Maquinas_Registradoras.Piso,Productos.Producto HAVING CAST(SUM(Productos.Precio) AS NUMERIC)<5000; 
