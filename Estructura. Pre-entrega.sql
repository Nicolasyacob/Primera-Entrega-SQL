DROP DATABASE IF	EXISTS polipiel;
CREATE DATABASE polipiel;

USE polipiel;

CREATE TABLE cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(200),
    apellido VARCHAR(200),
    telefono INT,
    direccion VARCHAR(200),
    email VARCHAR(200),
    red_social VARCHAR(200),
    fecha_registro DATE,
    PRIMARY KEY(id_cliente)
    );
    
    CREATE TABLE pago(
	id_pago INT NOT NULL AUTO_INCREMENT,
    metodo_pago VARCHAR(200),
    PRIMARY KEY(id_pago)
    );
    
     CREATE TABLE canal_venta(
	id_canal INT NOT NULL AUTO_INCREMENT,
    nombre_canal VARCHAR(200),
    PRIMARY KEY(id_canal)
    );
    
    CREATE TABLE empleados (
    id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    fecha_ingreso DATE,
    salario DECIMAL(10,2),
    PRIMARY KEY (id_empleado)
);

CREATE TABLE transporte (
    id_transporte INT NOT NULL AUTO_INCREMENT,
    nombre_empresa VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_transporte));
 
    CREATE TABLE producto (
    id_producto INT NOT NULL AUTO_INCREMENT,
    nombre_producto VARCHAR(200) NOT NULL,
    color VARCHAR(50),
    descripcion TEXT, 
    PRIMARY KEY (id_producto)
	);

CREATE TABLE venta (
    id_venta INT NOT NULL AUTO_INCREMENT,
    id_cliente INT,
    id_empleado INT,
    id_pago INT,
    id_canal INT,
	id_transporte INT,
    fecha_venta DATE,
    estado VARCHAR(50),
    total DECIMAL(10,2),
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
    FOREIGN KEY (id_pago) REFERENCES pago(id_pago),
    FOREIGN KEY (id_canal) REFERENCES canal_venta (id_canal),
    FOREIGN KEY (id_transporte) REFERENCES transporte (id_transporte));

	CREATE TABLE detalle_venta (
	id_detalle_venta INT NOT NULL AUTO_INCREMENT,
    id_producto INT,
    id_venta INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    PRIMARY KEY (id_detalle_venta),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta)
   );
    
    CREATE TABLE historial_venta (
	id_historial_venta INT NOT NULL AUTO_INCREMENT,
    id_venta INT,
    id_empleado INT,
    estado_anterior VARCHAR (50),
    estado_nuevo VARCHAR (50),
    fecha_cambio DATE,
    comentario TEXT,
    PRIMARY KEY (id_historial_venta),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY ( id_empleado) REFERENCES empleados(id_empleado)
   );

    CREATE TABLE proveedor (
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre_proveedor VARCHAR(200) NOT NULL,
    telefono VARCHAR(50),
    email VARCHAR(50) UNIQUE, 
    direccion VARCHAR(50),
    ciudad VARCHAR(50), 
    PRIMARY KEY (id_proveedor)
	);

CREATE TABLE venta (
    id_venta INT NOT NULL AUTO_INCREMENT,
    id_cliente INT,
    id_empleado INT,
    id_pago INT,
    id_canal INT,
	id_transporte INT,
    fecha_venta DATE,
    estado VARCHAR(50),
    total DECIMAL(10,2),
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
    FOREIGN KEY (id_pago) REFERENCES pago(id_pago),
    FOREIGN KEY (id_canal) REFERENCES canal_venta (id_canal),
    FOREIGN KEY (id_transporte) REFERENCES transporte (id_transporte));
    
	CREATE TABLE producto_material (
	id_producto_material INT NOT NULL AUTO_INCREMENT,
    id_producto INT NOT NULL,
    cantidad_requerida INT,
    PRIMARY KEY (id_producto_material),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto));
    
    CREATE TABLE stock (
    id_stock INT NOT NULL AUTO_INCREMENT,
    id_producto_material INT NOT NULL,
    id_empleado INT NOT NULL,
    id_proveedor INT,
    cantidad_disponible INT,
    costo_unitario DECIMAL(10,2),
    PRIMARY KEY (id_stock),
    FOREIGN KEY (id_producto_material) REFERENCES producto_material (id_producto_material),
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor));
    
    

        