create database AetherIncSop;
use AetherIncSop;

create table usuarios (
nombre varchar(12), 
contrasena varchar(12), 
email varchar(50),
rol varchar(30)
);


create table Reportes (
id int(100),
autor varchar(200),
nombre varchar(200),
modulo varchar(200),
descripcion varchar(200),
ingeniero varchar(200),
estado varchar(20),
respuesta varchar (1000)
);

insert into usuarios values ("Fernando","1234567","fernando.torres@live.com.mx","Ingeniero de Soporte");
insert into usuarios values ("Ethan","1234567","ethan.oliva@hotmail.com", "Operador");
insert into usuarios values ("Julian", "1234567","julian.alcibar@gmail.com","Gerente de Soporte");
insert into usuarios values ("Alejandro", "1234567", "alejandro.valdivia@yahoo.com", "Ingeniero de Soporte");

insert into Reportes values ("1","Ethan", "Error pulsera", "Configuracion", "No se conecta la pulsera a la aplicacion","Fernando","Sin resolver", "Sin respuesta");
insert into Reportes values ("2", "Julian", "Error Mapa", "Zona de Riesgos", "No cargan las zonas de riesgos en el mapa","Alejandro","Sin resolver","Sin respuesta");