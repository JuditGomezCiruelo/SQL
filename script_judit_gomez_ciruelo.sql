--creamos el esquema
create schema judit_gomez_ciruelo authorization vfahuhqr;

--crear tablas

--grupo
create table judit_gomez_ciruelo.grupo(
	ID_GRUPO varchar (3) not null,--PK
	GRUPO varchar (25) not null
);

alter table judit_gomez_ciruelo.grupo 
	add constraint grupo_PK primary key (ID_GRUPO);

--marca
create table judit_gomez_ciruelo.marca(
	ID_MARCA varchar (4) not null,--PK
	ID_GRUPO varchar (3) not null, --FK --> grupo (id_grupo)
	MARCA varchar (20) not null
);

alter table judit_gomez_ciruelo.marca
	add constraint marca_PK primary key (ID_MARCA);

--modelo
create table judit_gomez_ciruelo.modelo(
	ID_MODELO varchar (4) not null, --PK
	ID_MARCA varchar (4) not null,--FK --> marca (id_marca)
	MODELO varchar (20) not null
);

alter table judit_gomez_ciruelo.modelo
	add constraint modelo_pk primary key (ID_MODELO);

--color
create table judit_gomez_ciruelo.color(
	ID_COLOR varchar (4) not null,--PK
	COLOR varchar (15) not null
);

alter table judit_gomez_ciruelo.color
	add constraint color_pk primary key (ID_COLOR);

--seguro
create table judit_gomez_ciruelo.seguro(
	ID_ASEGURADORA varchar(4) not null,--PK
	ASEGURADORA varchar (20) not null
);

alter table judit_gomez_ciruelo.seguro
	add constraint seguro_pk primary key (ID_ASEGURADORA);

--poliza
create table judit_gomez_ciruelo.poliza(
	ID_VEHICULO varchar (4) not null,--PK,FK --> vehiculo (id_vehiculo)
	NUM_POLIZA varchar (16) not null,--PK
	ID_ASEGURADORA varchar (4) not null,--FK --> seguro(id_aseguradora)
	FECHA_FIN date not null
);

alter table judit_gomez_ciruelo.poliza
	add constraint poliza_PK primary key (ID_VEHICULO,NUM_POLIZA);

--divisas

create table judit_gomez_ciruelo.divisas(
	ID_DIVISA integer not null, --PK
	DIVISA varchar(3) not null
	);

alter table judit_gomez_ciruelo.divisas
	add constraint divisas_pk primary key (ID_DIVISA);

--revisiones
create table judit_gomez_ciruelo.revisiones(
	ID_VEHICULO varchar (4) not null, --PK, PF --> vehiculos(id_vehiculo)
	ID_REVISION varchar (4) not null, --PK
	ID_DIVISA integer not null, --FK --> divisas(id_divisa)
	KILOMETRAJE numeric(6,0) not null,
	FECHA date not null,
	IMPORTE numeric (6,2) not null
);

alter table judit_gomez_ciruelo.revisiones
	add constraint revisiones_PK primary key (ID_VEHICULO,ID_REVISION);
	
--vehiculos
create table judit_gomez_ciruelo.vehiculos(
	ID_VEHICULO varchar (4) not null,-- PK
	ID_MODELO varchar (4) not null,-- FK --> modelo(id_modelo)
	ID_COLOR varchar (4) not null,-- FK --> color(id_color)
	MATRICULA varchar (7) not null,
	FECHA_DE_COMPRA date not null,
	KM_TOTAL numeric(6,0) not null
);

alter table judit_gomez_ciruelo.vehiculos
	add constraint vehiculos_PK primary key (ID_VEHICULO);

--FK--

alter table judit_gomez_ciruelo.marca
	add constraint marca_FK foreign key (ID_GRUPO)
	references judit_gomez_ciruelo.grupo (ID_GRUPO);
	
alter table judit_gomez_ciruelo.modelo
	add constraint modelom_FK foreign key (ID_MARCA)
	references judit_gomez_ciruelo.marca (ID_MARCA);
	
alter table judit_gomez_ciruelo.poliza 
	add constraint polizav_FK foreign key (ID_VEHICULO)
	references judit_gomez_ciruelo.vehiculos (ID_VEHICULO);
	
alter table judit_gomez_ciruelo.poliza 
	add constraint polizaa_FK foreign key (ID_ASEGURADORA)
	references judit_gomez_ciruelo.seguro (ID_ASEGURADORA);
	
alter table judit_gomez_ciruelo.revisiones
	add constraint revisionesv_FK foreign key (ID_VEHICULO)
	references judit_gomez_ciruelo.vehiculos (ID_VEHICULO);

alter table judit_gomez_ciruelo.revisiones
	add constraint revisionesd_FK foreign key (ID_DIVISA)
	references judit_gomez_ciruelo.divisas (ID_DIVISA);
	
alter table judit_gomez_ciruelo.vehiculos
	add constraint vehiculosm_FK foreign key (ID_MODELO)
	references judit_gomez_ciruelo.modelo (ID_MODELO);

alter table judit_gomez_ciruelo.vehiculos
	add constraint vehiculosc_FK foreign key (ID_COLOR)
	references judit_gomez_ciruelo.color (ID_COLOR);
	
--DML--

--grupo
insert into judit_gomez_ciruelo.grupo
(ID_GRUPO, GRUPO)
values ('G01','Toyota Motor');

insert into judit_gomez_ciruelo.grupo
(ID_GRUPO, GRUPO)
values ('G02','Volkswagen Group');

insert into judit_gomez_ciruelo.grupo
(ID_GRUPO, GRUPO)
values ('G03','RNM');

insert into judit_gomez_ciruelo.grupo
(ID_GRUPO, GRUPO)
values ('G04','Grupo Stellanis');

--marca
insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B001', 'G01','Toyota');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B002', 'G01','Lexus');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B003', 'G01','Mazda');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B004', 'G02','Seat');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B005', 'G02','Volkswagen');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B006', 'G02','Cupra');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B007', 'G03','Renault');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B008', 'G03','Nissan');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B009', 'G03','Dacia');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B010', 'G04','Fiat');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B011', 'G04','Peugeot');

insert into judit_gomez_ciruelo.marca
(ID_MARCA, ID_GRUPO, MARCA)
values ('B012', 'G04','Opel');

--modelo
insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA,MODELO)
values ('M001','B001','Prius');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M002','B001','Corolla');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M003','B002','NX');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M004','B002','ES');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M005','B003','2 Hybrid');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M006','B003','CX-30');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M007','B004','Ibiza');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M008','B004','Arona');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M009','B005','Polo');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M010','B005','Golf');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M011','B006','Tarraco');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M012','B006','Formentor');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M013','B007','Clio');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M014','B007','Megane');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M015','B008','Qashqai');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M016','B008','Juke');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M017','B009','Duster');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M018','B009','Sandero');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M019','B010','500');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M020','B010','Tipo');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M021','B011','206');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M022','B011','308');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M023','B012','Corsa');

insert into judit_gomez_ciruelo.modelo
(ID_MODELO, ID_MARCA, MODELO)
values ('M024','B012','Astra');

--divisas
insert into judit_gomez_ciruelo.divisas
(ID_DIVISA, DIVISA)
values('001', 'EUR');

insert into judit_gomez_ciruelo.divisas
(ID_DIVISA, DIVISA)
values('002', 'USD');

insert into judit_gomez_ciruelo.divisas
(ID_DIVISA, DIVISA)
values('003', 'GBP');

--seguro

insert into judit_gomez_ciruelo.seguro 
(ID_ASEGURADORA,ASEGURADORA)
values('A001', 'Alianz');

insert into judit_gomez_ciruelo.seguro 
(ID_ASEGURADORA,ASEGURADORA)
values('A002', 'Linea Directa');

insert into judit_gomez_ciruelo.seguro 
(ID_ASEGURADORA,ASEGURADORA)
values('A003', 'Mutua Madrileña');

--colores

insert into judit_gomez_ciruelo.color 
(ID_COLOR, COLOR)
values('C001', 'Blanco');

insert into judit_gomez_ciruelo.color 
(ID_COLOR, COLOR)
values('C002', 'Negro');

insert into judit_gomez_ciruelo.color 
(ID_COLOR, COLOR)
values('C003', 'Rojo');

insert into judit_gomez_ciruelo.color 
(ID_COLOR, COLOR)
values('C004', 'Azul');

-- vehiculos
insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V001','M008','C001','1111BCD','2020-01-25', 30000);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V002','M008','C003','1112BCD','2020-01-25', 28000);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V003','M008','C004','1113BCD','2020-01-25', 25000);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V004','M001','C002','0987ABC','2019-05-14', 31000);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V005','M002','C001','0988ABC','2019-05-14', 38090);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V006','M006','C003','1217ABC','2019-09-08', 40800);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V007','M003','C004','1218BCD','2020-03-12', 32060);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V008','M004','C001','1219BCD','2020-03-12', 23200);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V009','M007','C002','2120CDE','2021-08-25', 20900);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V010','M009','C002','2121CDE','2021-08-25', 19300);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V011','M010','C002','2122CDE','2021-08-25', 20040);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V012','M011','C003','2123CDE','2021-08-25', 22100);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V013','M013','C003','2032CDE','2021-02-14', 19000);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V014','M014','C004','2033CDE','2021-02-14', 18500);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V015','M015','C001','2034CDE','2021-02-14', 17200);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V016','M016','C001','2035CDE','2021-02-14', 19300);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V017','M020','C001','3181EFG','2021-10-12', 15300);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V018','M022','C003','3182EFG','2021-10-12', 16400);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V019','M021','C004','3183EFG','2021-10-12', 17000);

insert into judit_gomez_ciruelo.vehiculos 
(ID_VEHICULO,ID_MODELO,ID_COLOR, MATRICULA,FECHA_DE_COMPRA,KM_TOTAL)
values('V020','M024','C002','3184EFG','2021-10-12', 14900);

--polizas
insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V001','KC00000000000001','A001','2023-01-25');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V002','KC00000000000002','A001','2023-01-25');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V003','KC00000000000003','A001','2023-01-25');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V007','KC00000000000004','A001','2023-03-12');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V008','KC00000000000005','A001','2023-03-12');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V004','KC1000000000001','A002','2023-01-01');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V005','KC10000000000002','A002','2023-01-01');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V006','KC10000000000003','A002','2023-01-01');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V009','KC20000000000001','A002','2023-08-25');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V010','KC30000000000001','A003','2023-08-25');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V011','KC30000000000002','A003','2023-08-25');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V012','KC30000000000003','A003','2023-08-25');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V013','KC30000000000004','A003','2023-02-14');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V014','KC30000000000005','A003','2023-02-14');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V015','KC30000000000006','A003','2023-02-14');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V016','KC30000000000007','A003','2023-02-14');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V017','KC30000000000008','A003','2023-10-12');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V018','KC30000000000009','A003','2023-10-12');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V019','KC30000000000010','A003','2023-10-12');

insert into judit_gomez_ciruelo.poliza 
(ID_VEHICULO,NUM_POLIZA,ID_ASEGURADORA,FECHA_FIN)
values('V020','KC30000000000011','A003','2023-10-12');

--revisiones

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V001','R001','1',17000,'2022-01-20',185.30);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V002','2022','1',21300,'2022-01-20',200.80);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V003','2022','1',18900,'2023-01-20',199.00);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V007','2022','2',17200,'2022-03-10',170.30);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V008','2022','2',16090,'2022-03-10',150.30);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V004','2022','1',23000,'2022-01-06',223.00);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V005','2022','1',25900,'2022-01-06',189.00);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V006','2022','2',31000,'2022-01-06',320.30);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V009','2022','1',16020,'2022-08-23',120.50);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V010','2022','1',14800,'2022-08-23',134.00);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V011','2022','1',15090,'2022-08-23',129.00);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V012','2022','1',17550,'2023-08-23',150.25);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V013','2022','3',16200,'2022-02-14',140.25);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V014','2022','3',15040,'2022-02-14',135.50);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V015','2022','3',14900,'2022-02-14',129.30);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V016','2022','3',17200,'2022-02-14',145.90);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V017','2022','1',12800,'2022-10-12',110.90);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V018','2022','1',13450,'2022-10-12',115.80);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V019','2022','1',14290,'2022-10-12', 123.15);

insert into judit_gomez_ciruelo.revisiones 
(ID_VEHICULO,ID_REVISION,ID_DIVISA,KILOMETRAJE,FECHA,IMPORTE)
values('V020','2022','1',12930,'2022-10-12', 100.00);