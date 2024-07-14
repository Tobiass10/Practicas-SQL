

select * from oficina

 

---1)
SELECT	codigo_oficina, ciudad from oficina where ciudad is not null;

 

---2) 
SELECT ciudad, telefono from oficina where pais = 'España'

 

---3)
SELECT nombre, apellido1, apellido2, email from empleado where codigo_jefe = '7'

 

---4)
SELECT puesto, nombre, apellido1, apellido2, email from empleado where codigo_jefe IS NULL

 

---5)
SELECT nombre, apellido1, apellido2, puesto from empleado where puesto <> 'Representante Ventas'

 

---6)
SELECT nombre_cliente from cliente where pais = 'Spain'

 

---7)
SELECT distinct estado from pedido

 

---8)
select * from cliente
select * from pago

 

select distinct codigo_cliente from pago where year(fecha_pago) = 2008
select distinct codigo_cliente from pago where format(fecha_pago , 'yyyy') = 2008
select distinct codigo_cliente from pago where fecha_pago like '2008%'

 

---9) 
select codigo_cliente, codigo_pedido, fecha_esperada, fecha_entrega from pedido where fecha_esperada < fecha_entrega;

 

---10)
SELECT distinct codigo_cliente, codigo_pedido, fecha_esperada, fecha_entrega from pedido where fecha_entrega <= dateadd(d,-2, fecha_esperada)
SELECT distinct codigo_cliente, codigo_pedido, fecha_esperada, fecha_entrega from pedido where datediff(d, fecha_esperada, fecha_entrega) <=-2}

 

---11)
select * from pedido where estado = 'Rechazado' and year(fecha_pedido) = 2009

 

---12)
select * from pedido where estado = 'Entregado' and format(fecha_entrega, 'MM') = 01

 

---13)
select * from pago where year(fecha_pago) = 2008 and forma_pago = 'PayPal' order by fecha_pago desc

 

---14)
select distinct forma_pago from pago

 

---15)
select * from producto where gama = 'Ornamentales' and cantidad_en_stock > 100 order by precio_venta desc;

 

---16)
select * from cliente where ciudad = 'Madrid' and (codigo_empleado_rep_ventas = 11 or codigo_empleado_rep_ventas = 30)


---Parte 2

---1)
--- INNER JOIN
SELECT cliente.nombre_cliente , empleado.nombre , empleado.apellido1 , empleado.apellido2 
FROM cliente
INNER JOIN empleado
ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado

--- NATURAL JOIN
SELECT cliente.nombre_cliente , empleado.nombre , empleado.apellido1 , empleado.apellido2
FROM cliente,empleado


---2)
--- INNER JOIN







select * from cliente
select * from empleado


