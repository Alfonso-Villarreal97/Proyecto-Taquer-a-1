CREATE TABLE Usuarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    Usuarios VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Apellido VARCHAR(45) NOT NULL,
    Rol VARCHAR(20) NOT NULL
);

INSERT INTO Usuarios (Usuarios, Password, Nombre, Apellido, Rol) VALUES
('Usuario1', 'Contraseña1', 'Dummy1', 'Dummylon', 'Administrador'),
('Usuario2', 'Contraseña2', 'Dummy2', 'Dummygod', 'Mesero'),
('Usuario3', 'Contraseña3', 'Dummy3', 'Dummyleon', 'Mesero');

SELECT * FROM Usuarios;

DELETE FROM Usuarios WHERE Usuario = 'mesero1';

DROP TABLE Usuarios;

SELECT * FROM Usuarios WHERE Usuario = 'admin' AND Password = '123';

CREATE TABLE Productos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Categoria VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL
);

INSERT INTO Productos (Categoria, Descripcion, Precio) VALUES
('Tacos', 'Pastor', 25.50),
('Tacos', 'Asada', 27.00),
('Tacos', 'Carnitas', 26.00),
('Tacos', 'Lengua', 28.50),
('Tacos', 'Chorizo', 24.00),
('Tortas', 'Milanesa', 45.00),
('Tortas', 'Pierna', 42.00),
('Tortas', 'Hawaiana', 50.00),
('Tortas', 'Cubana', 48.50),
('Tortas', 'Vegetariana', 40.00),
('Gringas', 'Pastor con queso', 35.00),
('Gringas', 'Asada con queso', 37.50),
('Gringas', 'Choriqueso', 32.00),
('Gringas', 'Suadero con queso', 38.00),
('Gringas', 'Hawaiana con queso', 39.50),
('Bebidas', 'Coca Cola', 15.00),
('Bebidas', 'Pepsi', 14.00),
('Bebidas', 'Boing de guayaba', 18.00),
('Bebidas', 'Agua de horchata', 16.50),
('Bebidas', 'Jamaica fresca', 17.00);


SELECT * FROM Productos;

DROP TABLE Productos;

SELECT DISTINCT Categoria FROM Productos;

CREATE TABLE resumenVentas (
    NumeroDeOrden INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE,
    Mesero VARCHAR(50),
    Ganancia DECIMAL(10, 2)
);

INSERT INTO resumenVentas (Fecha, Mesero, Ganancia) VALUES
('2023-12-28', 'Mesero1', 50.00),
('2023-12-29', 'Mesero2', 75.50),
('2023-12-30', 'Mesero3', 60.25),
('2023-12-31', 'Mesero4', 90.00),
('2024-01-01', 'Mesero5', 120.75),
('2024-01-02', 'Mesero6', 55.50),
('2024-01-03', 'Mesero7', 80.25),
('2024-01-04', 'Mesero8', 110.00),
('2024-01-05', 'Mesero9', 95.75),
('2024-01-06', 'Mesero10', 70.50);


SELECT * FROM resumenVentas;
DROP TABLE resumenVentas;