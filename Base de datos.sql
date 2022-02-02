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
nombre varchar(25) not null,
precio int default 9999,
stock int default 99,
id_categoria int not null,
foreign key (id_categoria) references categorias(id_categoria) on delete no action on update no action,
);
create table detalles(
num_detalle int identity,
id_factura int,
id_producto int,
precio int not null,
cantidad int not null,
primary key(num_detalle,id_factura),
foreign key (id_factura) references facturas(num_factura) on delete no action on update no action,
foreign key (id_producto) references productos(id_producto) on delete no action on update no action
);
