# DbGarden-Taller_DanielNavas

> [!NOTE]
>
> #### Se añadieron los comandos DDL(**Data Definition Language**) arriba 🔝 en el archivo llamado DDL_DanielNavas.sql
>
> #### Se añadieron los comandos DML(**Data Manipulation Language**) arriba 🔝 en el archivo llamado DML_DanielNavas.sql
>
> #### Se añadió la imagen ERD(**Entity Relationship Diagram**) arriba 🔝 en el archivo llamado ERD_DanielNavas.png



## Tablas

```mysql
+---------------------+
| Tables_in_garden    |
+---------------------+
| ciudad              |
| cliente             |
| contacto            |
| detalle_pedido      |
| direccion_cliente   |
| direccion_oficina   |
| direccion_proveedor |
| empleado            |
| estado_pedido       |
| forma_pago          |
| gama_producto       |
| oficina             |
| pago                |
| pais                |
| pedido              |
| precio              |
| producto            |
| proveedor           |
| puesto              |
| region              |
| telefono_cliente    |
| telefono_oficina    |
| telefono_proveedor  |
| tipo_pago           |
| tipo_telefono       |
+---------------------+
```



## Consultas

### Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```mysql
   SELECT o.id AS codigo_oficina, c.nombre AS ciudad
   FROM oficina AS o
   JOIN direccion_oficina AS do ON o.id = do.fkid_oficina
   JOIN ciudad AS c ON do.fkid_ciudad = c.id;
   
   +----------------+---------------+
   | codigo_oficina | ciudad        |
   +----------------+---------------+
   |              1 | Madrid Ciudad |
   |              2 | Fuenlabrada   |
   |              3 | Madrid Ciudad |
   |              4 | Madrid Ciudad |
   |              5 | Fuenlabrada   |
   |              6 | Barcelona     |
   |              7 | Barcelona     |
   |              8 | Tarragona     |
   |              9 | Fuenlabrada   |
   |             10 | Madrid Ciudad |
   +----------------+---------------+
   
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```mysql
   SELECT ciudad.nombre AS ciudad, telefono_oficina.numero AS telefono
   FROM direccion_oficina
   JOIN ciudad ON direccion_oficina.fkid_ciudad = ciudad.id
   JOIN telefono_oficina ON direccion_oficina.fkid_oficina = telefono_oficina.fkid_oficina
   JOIN pais ON direccion_oficina.fkid_pais = pais.id
   WHERE pais.nombre = 'España';
   
   +---------------+-------------+
   | ciudad        | telefono    |
   +---------------+-------------+
   | Madrid Ciudad | 123-456-789 |
   | Fuenlabrada   | 234-567-890 |
   | Madrid Ciudad | 345-678-901 |
   | Madrid Ciudad | 456-789-012 |
   | Fuenlabrada   | 567-890-123 |
   | Barcelona     | 678-901-234 |
   | Barcelona     | 789-012-345 |
   | Tarragona     | 890-123-456 |
   | Fuenlabrada   | 901-234-567 |
   | Madrid Ciudad | 012-345-678 |
   +---------------+-------------+
   
   ```

   

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

   ```mysql
   SELECT e.nombre, e.apellido1, e.apellido2, e.email
   FROM empleado AS e
   WHERE e.fkid_jefe = 7;
   
   +--------+-----------+-----------+------------------------------+
   | nombre | apellido1 | apellido2 | email                        |
   +--------+-----------+-----------+------------------------------+
   | Sofía  | Fernández | Díaz      | sofia.fernandez@example.com  |
   | Pablo  | López     | Pérez     | pablo.lopez@example.com      |
   | Elena  | Gómez     | Sánchez   | elena.gomez@example.com      |
   | Carlos | Rodríguez | López     | carlos.rodriguez@example.com |
   | Ana    | Sánchez   | Hernández | ana.sanchez@example.com      |
   +--------+-----------+-----------+------------------------------+
   
   ```

   

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

   ```mysql
   SELECT p.puesto AS puesto, e.nombre AS nombre, e.apellido1 AS apellido1, e.apellido2 AS apellido2, e.email AS email
   FROM empleado AS e
   JOIN puesto AS p ON e.fkid_puesto = p.id
   WHERE e.fkid_jefe IS NULL;
   
   +------------------+-----------+-----------+-----------+----------------------------+
   | puesto           | nombre    | apellido1 | apellido2 | email                      |
   +------------------+-----------+-----------+-----------+----------------------------+
   | Director General | Juan      | Pérez     | García    | juan.perez@example.com     |
   | Director Oficina | Pedro     | Martínez  | Gómez     | pedro.martinez@example.com |
   | Director Oficina | Alejandro | Díaz      | Martínez  | alejandro.diaz@example.com |
   +------------------+-----------+-----------+-----------+----------------------------+
   
   ```

   

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

   ```mysql
   SELECT e.nombre, e.apellido1, e.apellido2, p.puesto
   FROM empleado AS e
   JOIN puesto AS p ON e.fkid_puesto = p.id
   WHERE p.puesto != 'Representante Ventas';
   
   +-----------+-----------+-----------+-----------------------+
   | nombre    | apellido1 | apellido2 | puesto                |
   +-----------+-----------+-----------+-----------------------+
   | Juan      | Pérez     | García    | Director General      |
   | Ana       | López     | Martínez  | Subdirector Marketing |
   | Sofía     | Fernández | Díaz      | Subdirector Marketing |
   | Lucía     | Pérez     | Fernández | Subdirector Marketing |
   | Manuel    | García    | Sánchez   | Subdirector Marketing |
   | Carlos    | Sánchez   | Domínguez | Subdirector Ventas    |
   | Pablo     | López     | Pérez     | Subdirector Ventas    |
   | Elena     | Gómez     | Sánchez   | Subdirector Ventas    |
   | Carmen    | Sánchez   | Martínez  | Subdirector Ventas    |
   | Laura     | Díaz      | Hernández | Secretaria            |
   | Carlos    | Rodríguez | López     | Secretaria            |
   | Ana       | Sánchez   | Hernández | Secretaria            |
   | Javier    | González  | Pérez     | Secretaria            |
   | María     | González  | Martínez  | Director Oficina      |
   | Pedro     | Martínez  | Gómez     | Director Oficina      |
   | Alejandro | Díaz      | Martínez  | Director Oficina      |
   +-----------+-----------+-----------+-----------------------+
   
   ```

   

6. Devuelve un listado con el nombre de los todos los clientes españoles.

   ```mysql
   SELECT cliente.nombre AS nombre_cliente
   FROM cliente
   JOIN direccion_cliente ON cliente.id = direccion_cliente.fkid_cliente
   JOIN ciudad ON direccion_cliente.fkid_ciudad = ciudad.id
   JOIN region ON direccion_cliente.fkid_region = region.id
   JOIN pais ON direccion_cliente.fkid_pais = pais.id
   WHERE pais.nombre = 'España';
   
   +-------------------+
   | nombre_cliente    |
   +-------------------+
   | Roberto Martínez  |
   | Alejandra López   |
   | Fernando Sánchez  |
   | Isabel Gutiérrez  |
   | Gabriel Rodríguez |
   | Verónica Pérez    |
   | Marina Fernández  |
   | Andrés Ramírez    |
   +-------------------+
   
   ```

   

7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

   ```mysql
   SELECT estado
   FROM estado_pedido;
   
   +-----------+
   | estado    |
   +-----------+
   | Entregado |
   | Rechazado |
   | Pendiente |
   +-----------+
   
   ```

   

8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta: 

   • Utilizando la función `YEAR` de MySQL.

   ```mysql
   SELECT DISTINCT p.fkid_cliente AS codigo_cliente
   FROM pago AS p
   WHERE YEAR(p.fecha_pago) = 2008;
   
   +----------------+
   | codigo_cliente |
   +----------------+
   |              1 |
   |              3 |
   +----------------+
   
   ```

   • Utilizando la función `DATE_FORMAT` de MySQL.

   ```mysql
   SELECT DISTINCT p.fkid_cliente AS codigo_cliente2
   FROM pago AS p
   WHERE DATE_FORMAT(p.fecha_pago, '%Y') = '2008';
   
   +-----------------+
   | codigo_cliente2 |
   +-----------------+
   |               1 |
   |               3 |
   +-----------------+
   
   ```

   • Sin utilizar ninguna de las funciones anteriores.

   ```mysql
   SELECT DISTINCT p.fkid_cliente AS codigo_cliente3
   FROM pago AS p
   WHERE p.fecha_pago >= '2008-01-01' AND p.fecha_pago <= '2008-12-31';
   
   +-----------------+
   | codigo_cliente3 |
   +-----------------+
   |               1 |
   |               3 |
   +-----------------+
   
   ```

   

9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

   ```mysql
   SELECT id AS codigo_pedido, fkid_cliente AS codigo_cliente, fecha_esperada, fecha_entrega
   FROM pedido
   WHERE fecha_entrega > fecha_esperada;
   
   +---------------+----------------+----------------+---------------+
   | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
   +---------------+----------------+----------------+---------------+
   |             2 |              1 | 2024-04-06     | 2024-04-10    |
   |             4 |              1 | 2024-04-08     | 2024-04-10    |
   |             6 |              3 | 2024-04-10     | 2024-04-15    |
   |            10 |              2 | 2008-04-14     | 2008-04-18    |
   +---------------+----------------+----------------+---------------+
   
   ```

   

10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

    • Utilizando la función `ADDDATE` de MySQL.

    ```mysql
    SELECT id AS codigo_pedido, fkid_cliente AS codigo_cliente, fecha_esperada, fecha_entrega
    FROM pedido
    WHERE fecha_entrega < ADDDATE(fecha_esperada, -2);
    
    +---------------+----------------+----------------+---------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
    +---------------+----------------+----------------+---------------+
    |             5 |              3 | 2024-04-09     | 2024-04-05    |
    |             8 |              3 | 2024-04-12     | 2024-04-05    |
    |             9 |              2 | 2024-04-13     | 2024-04-04    |
    +---------------+----------------+----------------+---------------+
    
    ```

    • Utilizando la función `DATEDIFF` de MySQL.

    ```mysql
    SELECT id AS codigo_pedido, fkid_cliente AS codigo_cliente, fecha_esperada, fecha_entrega
    FROM pedido
    WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
    
    +---------------+----------------+----------------+---------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
    +---------------+----------------+----------------+---------------+
    |             1 |              1 | 2024-04-05     | 2024-04-03    |
    |             3 |              1 | 2024-04-07     | 2024-04-05    |
    |             5 |              3 | 2024-04-09     | 2024-04-05    |
    |             8 |              3 | 2024-04-12     | 2024-04-05    |
    |             9 |              2 | 2024-04-13     | 2024-04-04    |
    +---------------+----------------+----------------+---------------+
    
    ```

    • ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

    ```mysql
    -- No es posible resolver esta consulta utilizando el operador de suma o resta directamente en MySQL, ya que MySQL no permite realizar operaciones aritméticas directamente en fechas. Sin embargo, se puede usar una funcion llamada INTERVAL que permite lograr el mismo resultado.
    
    SELECT id AS codigo_pedido, fkid_cliente AS codigo_cliente, fecha_esperada, fecha_entrega
    FROM pedido
    WHERE fecha_entrega < fecha_esperada - INTERVAL 2 DAY;
    
    +---------------+----------------+----------------+---------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
    +---------------+----------------+----------------+---------------+
    |             5 |              3 | 2024-04-09     | 2024-04-05    |
    |             8 |              3 | 2024-04-12     | 2024-04-05    |
    |             9 |              2 | 2024-04-13     | 2024-04-04    |
    +---------------+----------------+----------------+---------------+
    
    ```

    

11. Devuelve un listado de todos los pedidos que fueron **rechazados** en 2009.

    ```mysql
    SELECT fecha_pedido, fecha_esperada, fecha_entrega, fkid_estado_pedido AS estado_pedido, fkid_cliente AS codigo_cliente, fkid_pago AS codigo_pago, comentarios
    FROM pedido
    WHERE fkid_estado_pedido = (SELECT id FROM estado_pedido WHERE estado = 'Rechazado')
    AND YEAR(fecha_pedido) = 2009;
    
    +--------------+----------------+---------------+---------------+----------------+-------------+-------------+
    | fecha_pedido | fecha_esperada | fecha_entrega | estado_pedido | codigo_cliente | codigo_pago | comentarios |
    +--------------+----------------+---------------+---------------+----------------+-------------+-------------+
    | 2009-04-10   | 2009-04-14     | 2009-04-18    |             2 |              2 |           7 | Rechazado   |
    | 2009-04-07   | 2009-04-11     | 2009-04-11    |             2 |              3 |           8 | Rechazado   |
    | 2009-04-03   | 2009-04-07     | 2009-04-05    |             2 |              1 |           6 | Rechazado   |
    +--------------+----------------+---------------+---------------+----------------+-------------+-------------+
    
    ```

    

12. Devuelve un listado de todos los pedidos que han sido **entregados** en el mes de enero de cualquier año.

    ```mysql
    SELECT fecha_pedido, fecha_esperada, fecha_entrega, fkid_estado_pedido AS estado_pedido, fkid_cliente AS codigo_cliente, fkid_pago AS codigo_pago, comentarios
    FROM pedido
    WHERE MONTH(fecha_entrega) = 1;
    
    +--------------+----------------+---------------+---------------+----------------+-------------+---------------------------+
    | fecha_pedido | fecha_esperada | fecha_entrega | estado_pedido | codigo_cliente | codigo_pago | comentarios               |
    +--------------+----------------+---------------+---------------+----------------+-------------+---------------------------+
    | 2023-10-06   | 2023-12-10     | 2024-01-15    |             1 |              3 |           5 | Entregado                 |
    | 2008-10-07   | 2009-01-21     | 2009-01-11    |             1 |              3 |           1 | Entregado antes de tiempo |
    | 2023-10-01   | 2024-12-05     | 2024-01-03    |             1 |              1 |           1 | Entregado                 |
    +--------------+----------------+---------------+---------------+----------------+-------------+---------------------------+
    
    ```

    

13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ```mysql
    SELECT fkid_cliente AS codigo_cliente, fkid_forma_pago AS codigo_forma_pago, fkid_tipo_pago AS codigo_tipo_pago, fecha_pago, total
    FROM pago
    WHERE YEAR(fecha_pago) = 2008 AND fkid_tipo_pago = (SELECT id FROM tipo_pago WHERE tipo = 'PayPal')
    ORDER BY total DESC;
    
    +----------------+-------------------+------------------+------------+--------+
    | codigo_cliente | codigo_forma_pago | codigo_tipo_pago | fecha_pago | total  |
    +----------------+-------------------+------------------+------------+--------+
    |              3 |                 1 |                1 | 2008-06-09 | 300.00 |
    |              1 |                 2 |                1 | 2008-06-15 | 250.00 |
    |              3 |                 2 |                1 | 2008-04-05 | 180.00 |
    +----------------+-------------------+------------------+------------+--------+
    
    ```

    

14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

    ```mysql
    SELECT DISTINCT forma
    FROM forma_pago;
    
    +---------------+
    | forma         |
    +---------------+
    | Pago Completo |
    | Pago a Plazos |
    +---------------+
    
    ```

    

15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

    ```mysql
    SELECT p.nombre, p.descripcion, p.cantidad_en_stock, pr.precio_venta
    FROM producto p
    JOIN precio pr ON p.id = pr.fkid_producto
    WHERE p.fkid_gama = 5
    AND p.cantidad_en_stock > 100
    ORDER BY pr.precio_venta DESC;
    
    +------------------+------------------------------------------------------+-------------------+--------------+
    | nombre           | descripcion                                          | cantidad_en_stock | precio_venta |
    +------------------+------------------------------------------------------+-------------------+--------------+
    | Violeta Morada   | Violeta de color morado intenso y aroma dulce.       |               315 |        11.99 |
    | Margarita Blanca | Margarita blanca de tallos largos y resistentes.     |               150 |         9.79 |
    | Azalea Rosa      | Azalea de flores rosas en maceta de barro.           |               200 |         8.49 |
    | Clavel Rojo      | Clavel rojo de larga duración en florero de cristal. |               125 |         7.99 |
    +------------------+------------------------------------------------------+-------------------+--------------+
    
    ```

    

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

    ```mysql
    SELECT cl.nombre
    FROM cliente AS cl
    JOIN direccion_cliente AS dc ON cl.id = dc.fkid_cliente
    JOIN ciudad AS ci ON dc.fkid_ciudad = ci.id
    JOIN empleado AS em ON cl.fkid_empleado = em.id
    WHERE ci.nombre = 'Madrid'
    AND em.id IN (11, 30);
    
    ```



### Consultas multitabla (Composición interna)

Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.
1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

  ```mysql
  -- SQL 1
  SELECT cliente.nombre AS NombreCliente, empleado.nombre AS NombreRepresentante, empleado.apellido1 AS ApellidoRepresentante
  FROM cliente, empleado
  WHERE cliente.fkid_empleado = empleado.id;
  
  -- SQL 2
  SELECT cliente.nombre AS NombreCliente, empleado.nombre AS NombreRepresentante, empleado.apellido1 AS ApellidoRepresentante
  FROM cliente
  INNER JOIN empleado ON cliente.fkid_empleado = empleado.id;
  
  +-------------------+---------------------+-----------------------+
  | NombreCliente     | NombreRepresentante | ApellidoRepresentante |
  +-------------------+---------------------+-----------------------+
  | Roberto Martínez  | Elena               | Gómez                 |
  | Alejandra López   | Laura               | Díaz                  |
  | Fernando Sánchez  | Carlos              | Sánchez               |
  | Isabel Gutiérrez  | Pablo               | López                 |
  | Gabriel Rodríguez | Juan                | Navas                 |
  | Verónica Pérez    | Sofía               | Fernández             |
  | Marina Fernández  | Diego               | Hernández             |
  | Andrés Ramírez    | Ana                 | López                 |
  +-------------------+---------------------+-----------------------+
  
  ```

  

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

  ```mysql
  
  ```

  

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

  ```mysql
  
  ```

  

4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

  ```mysql
  
  ```

  

5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece  el representante.

  ```mysql
  
  ```

  

6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

   ```mysql
   
   ```

   

7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

  ```mysql
  
  ```

  

8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

  ```mysql
  
  ```

  

9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

  ```mysql
  
  ```

  

10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

    ```mysql
    
    ```

    

11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

    ```mysql
    
    ```



### Consultas multitabla (Composición externa)

Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL LEFT JOIN y NATURAL RIGHT JOIN.
1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

  ```mysql
  
  ```

  

2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

  ```mysql
  
  ```

  

3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

  ```mysql
  
  ```

  

4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

  ```mysql
  
  ```

  

5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

  ```mysql
  
  ```

  

6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

  ```mysql
  
  ```

  

7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

  ```mysql
  
  ```

  

8. Devuelve un listado de los productos que nunca han aparecido en un pedido.

  ```mysql
  
  ```

  

9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

  ```mysql
  
  ```

  

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

    ```mysql
    
    ```

    

11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

    ```mysql
    
    ```

    

12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

    ```mysql
    
    ```



### Consultas resumen

1. ¿Cuántos empleados hay en la compañía?

   ```mysql
   
   ```

   

2. ¿Cuántos clientes tiene cada país?

   ```mysql
   
   ```

   

3. ¿Cuál fue el pago medio en 2009?

   ```mysql
   
   ```

   

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

  ```mysql
  
  ```

  

5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

  ```mysql
  
  ```

  

6. Calcula el número de clientes que tiene la empresa.

   ```mysql
   
   ```

   

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

   ```mysql
   
   ```

   

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

  ```mysql
  
  ```

  

9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

  ```mysql
  
  ```

  

10. Calcula el número de clientes que no tiene asignado representante de ventas.

    ```mysql
    
    ```

    

11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

    ```mysql
    
    ```

    

12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

    ```mysql
    
    ```

    

13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

    ```mysql
    
    ```

    

14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

    ```mysql
    
    ```

    

15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

    ```mysql
    
    ```

    

16. La misma información que en la pregunta anterior, pero agrupada por código de producto.

    ```mysql
    
    ```

    

17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

    ```mysql
    
    ```

    

18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

    ```mysql
    
    ```

    

19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

    ```mysql
    
    ```



### Subconsultas

##### Con operadores básicos de comparación

1. Devuelve el nombre del cliente con mayor límite de crédito.

   ```mysql
   
   ```

   

2. Devuelve el nombre del producto que tenga el precio de venta más caro.

   ```mysql
   
   ```

   

3. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)

  ```mysql
  
  ```

  

4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

  ```mysql
  
  ```

  

5. Devuelve el producto que más unidades tiene en stock.

   ```mysql
   
   ```

   

6. Devuelve el producto que menos unidades tiene en stock.

   ```mysql
   
   ```

   

7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de **Alberto Soria**.

  ```mysql
  
  ```



##### Subconsultas con ALL y ANY

8. Devuelve el nombre del cliente con mayor límite de crédito.

   ```mysql
   
   ```

   

9. Devuelve el nombre del producto que tenga el precio de venta más caro.

   ```mysql
   
   ```

   

10. Devuelve el producto que menos unidades tiene en stock.

    ```mysql
    
    ```



##### Subconsultas con IN y NOT IN

11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

    ```mysql
    
    ```

    

12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

    ```mysql
    
    ```

    

13. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

    ```mysql
    
    ```

    

14. Devuelve un listado de los productos que nunca han aparecido en un pedido.

    ```mysql
    
    ```

    

15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

    ```mysql
    
    ```

    

16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

    ```mysql
    
    ```

    

17. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

    ```mysql
    
    ```



##### Subconsultas con EXIST y NOT EXISTS

18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

    ```mysql
    
    ```

    

19. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

    ```mysql
    
    ```

    

20. Devuelve un listado de los productos que nunca han aparecido en un pedido.

    ```mysql
    
    ```

    

21. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

    ```mysql
    
    ```



### Consultas variadas

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

  ```mysql
  
  ```

  

2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

  ```mysql
  
  ```

  

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

  ```mysql
  
  ```

  

4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

  ```mysql
  
  ```

  

5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

  ```mysql
  
  ```

  

6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

  ```mysql
  
  ```

  

7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

  ```mysql
  
  ```
