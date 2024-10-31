# README - Base de Datos para "Polipiel"
Descripción General 📋
El emprendimiento familiar "Polipiel" se dedica a la fabricación y venta de productos personalizados y estándar como manteles, fundas de sillas, paneras, cubre sommier, y otros artículos de decoración, empleando materiales como cuerina, ecocuero, PVC, entre otros. Las ventas se realizan principalmente a través de redes sociales, sitios de e-commerce y WhatsApp. La empresa adquiere materia prima de proveedores locales para su fabricación, y distribuye los productos terminados mediante transportes a sus clientes.

Este modelo de base de datos busca organizar y optimizar la gestión de clientes, ventas, productos, materias primas y empleados para facilitar el manejo y control de la información del emprendimiento.

# DER-SQL
![image](https://github.com/user-attachments/assets/c1d175a9-6878-4a94-90e6-b361f349ce3d)


# DER EN WORKBENCH
![image](https://github.com/user-attachments/assets/4a0f80de-07e0-4573-b264-fdeb58b020b8)


## TABLAS

### 1. **cliente**
   - **Descripción**: Almacena información de los clientes.
   - **Columnas**:
     - `id_cliente`: INT (PK, AUTO_INCREMENT) - Identificador único de cada cliente.
     - `nombre`: VARCHAR(200) - Nombre del cliente.
     - `apellido`: VARCHAR(200) - Apellido del cliente.
     - `telefono`: INT - Teléfono del cliente.
     - `direccion`: VARCHAR(200) - Dirección del cliente.
     - `email`: VARCHAR(200) - Correo electrónico del cliente.
     - `red_social`: VARCHAR(200) - Red social del cliente.
     - `fecha_registro`: DATE - Fecha de registro del cliente.
     
### 2. **pago**
   - **Descripción**: Métodos de pago disponibles.
   - **Columnas**:
     - `id_pago`: INT (PK, AUTO_INCREMENT) - Identificador único del método de pago.
     - `metodo_pago`: VARCHAR(200) - Nombre del método de pago.

### 3. **canal_venta**
   - **Descripción**: Información de los canales de venta.
   - **Columnas**:
     - `id_canal`: INT (PK, AUTO_INCREMENT) - Identificador único del canal de venta.
     - `nombre_canal`: VARCHAR(200) - Nombre del canal de venta.

### 4. **empleados**
   - **Descripción**: Almacena datos de los empleados.
   - **Columnas**:
     - `id_empleado`: INT (PK, AUTO_INCREMENT) - Identificador único del empleado.
     - `nombre`: VARCHAR(100) - Nombre del empleado.
     - `apellido`: VARCHAR(100) - Apellido del empleado.
     - `rol`: VARCHAR(50) - Rol del empleado en la empresa.
     - `telefono`: VARCHAR(20) - Teléfono del empleado.
     - `email`: VARCHAR(100) - Correo electrónico del empleado.
     - `fecha_ingreso`: DATE - Fecha de ingreso del empleado.
     - `salario`: DECIMAL(10,2) - Salario del empleado.

### 5. **transporte**
   - **Descripción**: Información de las empresas de transporte.
   - **Columnas**:
     - `id_transporte`: INT (PK, AUTO_INCREMENT) - Identificador único del transporte.
     - `nombre_empresa`: VARCHAR(200) - Nombre de la empresa de transporte.

### 6. **producto**
   - **Descripción**: Almacena información de los productos.
   - **Columnas**:
     - `id_producto`: INT (PK, AUTO_INCREMENT) - Identificador único del producto.
     - `nombre_producto`: VARCHAR(200) - Nombre del producto.
     - `color`: VARCHAR(50) - Color del producto.
     - `descripcion`: TEXT - Descripción del producto.

### 7. **venta**
   - **Descripción**: Información de las ventas realizadas.
   - **Columnas**:
     - `id_venta`: INT (PK, AUTO_INCREMENT) - Identificador único de la venta.
     - `id_cliente`: INT (FK) - Referencia al cliente.
     - `id_empleado`: INT (FK) - Referencia al empleado.
     - `id_pago`: INT (FK) - Referencia al método de pago.
     - `id_canal`: INT (FK) - Referencia al canal de venta.
     - `id_transporte`: INT (FK) - Referencia al transporte.
     - `fecha_venta`: DATE - Fecha de la venta.
     - `estado`: VARCHAR(50) - Estado de la venta.
     - `total`: DECIMAL(10,2) - Total de la venta.

### 8. **detalle_venta**
   - **Descripción**: Detalles de los productos vendidos en cada venta.
   - **Columnas**:
     - `id_detalle_venta`: INT (PK, AUTO_INCREMENT) - Identificador único del detalle de venta.
     - `id_producto`: INT (FK) - Referencia al producto.
     - `id_venta`: INT (FK) - Referencia a la venta.
     - `cantidad`: INT - Cantidad de producto vendido.
     - `precio_unitario`: DECIMAL(10,2) - Precio unitario del producto.
     - `subtotal`: DECIMAL(10,2) - Subtotal de la venta de ese producto.

### 9. **historial_venta**
   - **Descripción**: Registro del historial de cambios en el estado de las ventas.
   - **Columnas**:
     - `id_historial_venta`: INT (PK, AUTO_INCREMENT) - Identificador único del historial.
     - `id_venta`: INT (FK) - Referencia a la venta.
     - `id_empleado`: INT (FK) - Referencia al empleado que hizo el cambio.
     - `estado_anterior`: VARCHAR(50) - Estado anterior de la venta.
     - `estado_nuevo`: VARCHAR(50) - Nuevo estado de la venta.
     - `fecha_cambio`: DATE - Fecha del cambio de estado.
     - `comentario`: TEXT - Comentarios sobre el cambio.

### 10. **proveedor**
   - **Descripción**: Información de los proveedores.
   - **Columnas**:
     - `id_proveedor`: INT (PK, AUTO_INCREMENT) - Identificador único del proveedor.
     - `nombre_proveedor`: VARCHAR(200) - Nombre del proveedor.
     - `telefono`: VARCHAR(50) - Teléfono del proveedor.
     - `email`: VARCHAR(50) UNIQUE - Correo electrónico del proveedor.
     - `direccion`: VARCHAR(50) - Dirección del proveedor.
     - `ciudad`: VARCHAR(50) - Ciudad del proveedor.

### 11. **producto_material**
   - **Descripción**: Almacena la relación entre productos y materiales requeridos.
   - **Columnas**:
     - `id_producto_material`: INT (PK, AUTO_INCREMENT) - Identificador único.
     - `id_producto`: INT (FK) - Referencia al producto.
     - `cantidad_requerida`: INT - Cantidad requerida del material.

### 12. **stock**
   - **Descripción**: Información del inventario de materiales.
   - **Columnas**:
     - `id_stock`: INT (PK, AUTO_INCREMENT) - Identificador único del stock.
     - `id_producto_material`: INT (FK) - Referencia a `producto_material`.
     - `id_empleado`: INT (FK) - Empleado encargado.
     - `id_proveedor`: INT (FK) - Proveedor de material.
     - `cantidad_disponible`: INT - Cantidad disponible en stock.
     - `costo_unitario`: DECIMAL(10,2) - Costo unitario del material.

## Relaciones

- Cada `cliente` puede realizar múltiples `ventas`, gestionadas por `empleados` y relacionadas con un `metodo_pago`, un `canal_venta` y una opción de `transporte`.
- Los `productos` y su cantidad requerida de materiales se definen en `producto_material`, y su disponibilidad es gestionada en `stock`.
- El `historial_venta` rastrea los cambios de estado de cada venta realizados por los `empleados`.

## Problemática Resuelta

Este modelo facilita la gestión integral de la empresa, permitiendo:
- Registrar clientes y transacciones de ventas con sus detalles, optimizando la trazabilidad y el historial de cambios.
- Controlar el stock de materiales y productos, incluyendo las relaciones con los proveedores y empleados responsables.
- Analizar ventas por canales y métodos de pago, obteniendo una mejor visión sobre el rendimiento comercial de la empresa.
