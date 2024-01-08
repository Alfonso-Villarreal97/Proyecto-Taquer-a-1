-- CREAR BASE DE DATOS
CREATE DATABASE bdtaque;
USE bdtaque;
DROP TABLE usuarios;

-- CREAR TABLAS PARA LA BASE DE DATOS
CREATE TABLE Usuarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    Usuarios VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Rol VARCHAR(20) NOT NULL
);
CREATE TABLE Productos(
	id INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Categoria VARCHAR(50) NOT NULL
);
ALTER TABLE productos DROP COLUMN Nombre;


ALTER TABLE Productos AUTO_INCREMENT = 0;
ALTER TABLE Usuarios AUTO_INCREMENT = 0;

UPDATE usuarios SET Rol = 'Administrador' WHERE Usuarios = 'Usuario2';
-- INSERCIONES DE DATOS DUMMY
INSERT INTO Usuarios (Usuarios, Password, Nombre,  Rol) VALUES
('Usuario1', 'Contraseña1', 'Dummy1', 'Administrador'),
('Usuario2', 'Contraseña2', 'Dummy2', 'Mesero'),
('Usuario3', 'Contraseña3', 'Dummy3', 'Mesero');

-- ****************************** --
-- *		HUGO SCRIPT			* --
-- ****************************** --
CREATE TABLE Productos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Categoria VARCHAR(50) NOT NULL
);

SELECT * FROM Productos;

DROP TABLE Productos;