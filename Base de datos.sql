create database facturacion;
use facturacion;
create table clientes(
id_cliente int identity primary key,
nombre varchar(25) not null,
apellido varchar(25) not null,
direccion varchar(55) not null,
fecha_nacimiento date not null,
telefono char(11) not null,
email varchar(55) not null
);
create table modo_pagos(
num_pago int identity primary key,
nombre varchar(25) not null,
otros_detalles varchar(25) not null,
);
create table categorias(
id_categoria int identity primary key,
nombre varchar(25) not null,
descripcion varchar(25) not null,
);
create table facturas(
num_factura int identity primary key,
id_cliente int,
fecha date not null,
num_pago int,
foreign key (id_cliente) references clientes(id_cliente) on delete no action on update no action,
foreign key (num_pago) references modo_pagos(num_pago) on delete no action on update no action
);
create table productos(
id_producto int identity primary key,
nombre varchar(255) not null,
precio int default 9999,
stock int default 99,
id_categoria int not null,
foreign key (id_categoria) references categorias(id_categoria) on delete no action on update no action,
);
create table detalles(
num_detalle int,
id_factura int,
id_producto int,
precio int not null,
cantidad int not null,
primary key(num_detalle,id_factura),
foreign key (id_factura) references facturas(num_factura) on delete no action on update no action,
foreign key (id_producto) references productos(id_producto) on delete no action on update no action
);
insert into clientes(nombre,apellido,direccion,fecha_nacimiento,telefono,email) values 
('edwin','barragan','Calle 1','1981-01-01','3012129344','ebarragan@udemedellin.edu.co'),
('esperanza','gomez','Cra 99','1981-01-01','301555777','esperancita@gmail.com'),
('Juan','Herrera','Cra 1','1981-01-01','3012121212','Juan@gmail.com'),
('Camilo','Roa','Cra 2','1981-09-02','3012121213','Camilo@gmail.com'),
('Andres','Ochoa','Cra 3','1991-01-03','3012121214','Andres@gmail.com'),
('Felipe','Perez','Cra 4','1999-01-04','3012121215','Felipe@gmail.com'),
('Carlos','Jimenez','Cra 5','1981-01-05','3012121216','Carlos@gmail.com'),
('Andrea','Aristizabal','Cra 6','2001-01-06','3012121217','Andrea@gmail.com'),
('Esteban','Restrepo','Cra 7','1989-01-07','3012121218','Esteban@gmail.com'),
('Amelia','Rua','Cra 8','1971-01-08','3012121219','Amelia@gmail.com'),
('Eliecer','Corredor','Cra 9','1991-01-09','3012121220','Eliecer@gmail.com'),
('Melquiadez','Higuita','Cra 10','2009-01-10','3012121221','Melquiadez@gmail.com'),
('Veronica','Maturana','Cra 11','2003-01-11','3012121222','Veronica@gmail.com'),
('Estefania','Herrera','Cra 12','1961-01-12','3012121223','Estefania@gmail.com'),
('Esmeralda','Londoño','Cra 13','1961-01-13','3012121224','Esmeralda@gmail.com'),
('Erika','Muñoz','Cra 14','1961-01-14','3012121225','Erika@gmail.com'),
('Hernan','Quintero','Cra 15','1961-01-15','3012121226','Hernan@gmail.com');
insert into categorias(nombre,descripcion) values 
('Electrodomésticos','Electrodomésticos'),
('Mercado','Canasta familiar'),
('Vestuario','Ropa'),
('Ferreteria','Herramientas'),
('Juguetería ','Juguetes');
insert into productos(nombre,precio,stock,id_categoria) values
('Nevera 294 litros','1600000','40','1'),
('Televisor 55'+ char(39),'1700000','21','1'),
('Arroz Diana 5 Kg','14000','200','2'),
('Arroz Roa 5 kg','15000','220','2'),
('Figura Max Steel Y5572','35000','10','5'),
('Cinta Aislante 15m x 18mm','5000','44','4'),
('Lenteja X 500 gr','3500','333','2'),
('Canasta 30 huevos AAA','21000','111','2'),
('Camiseta Polo Para Hombre L','35500','20','3');
insert into modo_pagos(nombre,otros_detalles) values
('efectivo','monedas y billetes'),
('tarjeta débito','tarjeta débito'),
('tarjeta crédito','tarjeta crédito'),
('bitcoin','criptomoneda');
insert into facturas(id_cliente,fecha,num_pago) values
('1','2022-01-20','1'),
('1','2022-01-22','1'),
('2','2022-01-28','1'),
('2','2022-01-08','2'),
('2','2021-12-24','2'),
('2','2022-01-20','1'),
('3','2022-01-31','1'),
('4','2022-01-14','1'),
('5','2022-01-09','1'),
('9','2022-01-16','1'),
('10','2022-01-14','2'),
('10','2022-01-04','1'),
('10','2022-01-10','1'),
('11','2021-12-24','4'),
('12','2021-12-27','1'),
('15','2022-01-28','1');
insert into detalles values
('1','1','1','1600000','1'),
('2','1','2','1700000','1'),
('3','1','3','14000','2'),
('4','1','7','3500','5'),
('5','1','9','35500','2'),
('1','2','5','35000','1'),
('2','2','4','15000','2'),
('1','3','4','15000','2'),
('1','4','4','15000','2'),
('1','5','4','15000','2'),
('1','6','4','15000','2'),
('2','6','7','3500','4'),
('3','6','1','1600000','1'),
('4','6','2','1700000','1'),
('5','6','3','14000','4'),
('6','6','5','35000','4'),
('7','6','6','5000','5'),
('8','6','8','21000','1'),
('1','7','7','3500','4'),
('1','8','7','3500','4'),
('1','9','7','3500','4'),
('1','10','7','3500','4'),
('2','10','3','14000','2'),
('1','11','7','3500','4'),
('2','11','3','14000','2'),
('3','12','9','35500','2'),
('1','13','7','3500','4'),
('1','14','7','3500','4'),
('1','15','7','3500','4'),
('1','16','3','14000','2');
