---------------------------------------------------------------------------------
--INSERCION de datos en LAS TABLAS DEL ESQUEMA "CONCESIONARIOS DE COCHES"
---------------------------------------------------------------------------------

/*****************************************************************************
** Los INSERT estan por orden alfabetico segun el nombre de la tabla.       **
******************************************************************************/

-- CLIENTES 
INSERT INTO CLIENTE (dni, nombre, telefono, cuenta) -- sin compras
  VALUES('78901234C', 'ARGIMIRA', 678901234, 12345678901234567893);
INSERT INTO CLIENTE (dni, nombre, telefono, cuenta)
  VALUES('12345678Z', 'ZACARIAS', 612345678, 12345678901234567891);
INSERT INTO CLIENTE (dni, nombre, telefono, cuenta)
  VALUES('23456789Y', 'YOTUELINO', 623456789, 12345678901234567892);
INSERT INTO CLIENTE (dni, nombre, telefono, cuenta)
  VALUES('34567890G', 'GERTRUDIS', 634567890, NULL);--pago en efectivo
INSERT INTO CLIENTE (dni, nombre, telefono, cuenta)
  VALUES('45678901W', 'WALLACE', 645678901, 12345678901234567894);
INSERT INTO CLIENTE (dni, nombre, telefono, cuenta)
  VALUES('56789012V', 'VALERIANO', 656789012, 12345678901234567895);
INSERT INTO CLIENTE (dni, nombre, telefono, cuenta) -- sin compras
  VALUES('67890123T', 'TORIBIA', 667890123, NULL);


-- MARCAS
SET CONSTRAINTS MAR_FK_CON DEFERRED;

INSERT INTO MARCA (idmarca, nombre, concesionario_principal) 
  VALUES('MA01', 'TOYOTA', 'CO01');
INSERT INTO MARCA (idmarca, nombre, concesionario_principal) 
  VALUES('MA02', 'VOLKSWAGEN', 'CO02');
INSERT INTO MARCA (idmarca, nombre, concesionario_principal) 
  VALUES('MA03', 'OPEL', 'CO03');
INSERT INTO MARCA (idmarca, nombre, concesionario_principal) 
  VALUES('MA04', 'PEUGEOT', 'CO04');
INSERT INTO MARCA (idmarca, nombre, concesionario_principal) 
  VALUES('MA05', 'RENAULT', 'CO05');
INSERT INTO MARCA (idmarca, nombre, concesionario_principal) 
  VALUES('MA06', 'NISSAN', 'CO06');
INSERT INTO MARCA (idmarca, nombre, concesionario_principal) 
  VALUES('MA07', 'JEEP', 'CO07');
  
  -- 12 CONCESIONARIOS. 
-- ** Todos ellos con 1 vendedor: se actualizara despues a su valor correcto, **
-- ** como se indica en el enunciado                                          ** 

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO01', 'TOYOTA CENTRAL', 'C/ ORION, 1', 601010101, 1, 'MA01');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO02', 'VOLKSWAGEN CENTRAL',  'C/ CASIOPEA, 2', 601010102, 1, 'MA02');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO03', 'OPEL CENTRAL', 'C/ ANDROMEDA, 3', 601010103, 1, 'MA03');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO04', 'PEUGEOT CENTRAL', 'C/ AURIGA, 4', 601010104, 1, 'MA04');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO05', 'RENAULT CENTRAL', 'C/ CENTAURUS, 5', 601010105, 1, 'MA05');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO06', 'NISSAN CENTRAL', 'C/ PEGASUS, 6', 601010106, 1, 'MA06');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO07', 'JEEP CENTRAL', 'C/ CENTAURUS , 7', 601010107, 1, 'MA07');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO08', 'TOYOTA SUR', 'C/ SERPENS, 8', 601010108, 1, 'MA01');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO09', 'TOYOTA OESTE', 'PHOENIX, 9', 601010109, 1, 'MA01');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO10', 'VOLKSWAGEN SUR', 'C/ PERSEUS, 10', 601010110, 1, 'MA02');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO11', 'RENAULT NORTE', 'C/ URSA MAIOR, 11', 601010111, 1, 'MA05');

INSERT INTO CONCESIONARIO (codigo, nombre, direccion, telefono, num_vendedores, marca)
  VALUES ('CO12', 'NISSAN ESTE', 'C/ URSA MINOR, 12', 601010112, 1, 'MA06');
  
SET CONSTRAINTS MAR_FK_CON IMMEDIATE;
  
-- MODELOS. Hay varios con igual nombre de distintas marcas
--TOYOTA
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA01', 'YARIS', 10000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA01', 'AURIS', 15000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA01', 'RAV4', 25500);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA01', 'VERSO', 18000.50);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA01', 'LAND CRUISER', 36000);

--VOLKSWAGEN
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA02', 'POLO', 25000.90);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA02', 'GOLF', 35000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA02', 'PASSAT', 45000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA02', 'VERSO', 55000);

--OPEL
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA03', 'CORSA', 12000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA03', 'ZAFIRA', 16500);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA03', 'CHEROKEE', 16000.75);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA03', '207', 18000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA03', 'LAGUNA', 25000);

--PEUGEOT
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA04', '208', 14000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA04', '207', 25000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA04', '308', 17600.50);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA04', '3008', 21800);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA04', '107', 12000);

-- RENAULT
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA05', 'TWINGO', 11700);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA05', 'CLIO', 12000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA05', 'LAGUNA', 22500);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA05', 'MEGANE', 15500.99);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA05', 'VERSO', 19000);

-- NISSAN
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA06', '207', 17500);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA06', 'MICRA', 12000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA06', 'CHEROKEE', 14500.50);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA06', 'JUKE', 17000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA06', 'QASQAI', 21000);

-- JEEP
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA07', 'CHEROKEE', 40000);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA07', 'WRANGLER', 45000.75);
INSERT INTO MODELO (marca, nombre, precio_recomendado)
  VALUES ('MA07', 'RENEGADE', 50000);

-- VENDEDORES
-- ** La mayoria tienen supervisor (jefe). Hay que ordenar estas INSERT para que no **
-- ** surjan problemas de integridad referencial (claves ajenas)                    **
SET CONSTRAINTS VEN_FK_VEN DEFERRED;

INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('11111111A', 'ANACLETO', 611111111, NULL, 'CO01', 10);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('88888888D', 'DESISERIO', 611111111, '11111111A', 'CO08', 5);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('99999999A', 'ARGIRIO', 611111111, '11111111A', 'CO09', 10);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('10101010E', 'ELEUTERIA', 622222222, '22222222E', 'CO10', 5);

INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('11211211E', 'EUTIMIO', 655555555, '55555555U', 'CO11', 5);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('22222222E', 'EMETRIA', 622222222, NULL, 'CO02', 15);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('33333333I', 'INCLITO', 633333333, NULL, 'CO03', 10);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('44444444O', 'OVIDIA', 644444444, NULL, 'CO04', 12);

INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('01111111A', 'ADAMIRO', 611111111, '11111111A', 'CO01', 10);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('02222222E', 'EUSTAQUIO', 622222222, '22222222E', 'CO02', 5);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('03333333I', 'ISABELO', 633333333, '33333333I', 'CO03', 5);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('04444444O', 'OSTRACIO', 644444444, '44444444O', 'CO04', 5);

INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('05555555H', 'HONORATA', 655555555, '66666666M', 'CO12', 10);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('06666666N', 'NICANOR', 655555555, '05555555H', 'CO12', 5);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('11223344C', 'CLEMENTINO', 611223344, '11111111A', 'CO08', 10);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('22334455A', 'AMERINDIA', 622334455, '11111111A', 'CO09', 5);

INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('33445566S', 'SALUSTIANO', 633445566, '22222222E', 'CO10', 5);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('44556677A', 'APOLONIO', 644556677, '55555555U', 'CO11', 5);  
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('55555555U', 'ULPIDIO', 655555555, NULL, 'CO05', 10);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('66666666M', 'MELINDA', 666666666, NULL, 'CO06', 12);

INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('77777777C', 'CLOROMIRO', 677777777, NULL, 'CO07', 10);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('55667788M', 'MARIANELO', 655667788, '05555555H', 'CO12', 5);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('66778899C', 'CELEDONIA', 666778899, '11111111A', 'CO08', 10);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('77889900F', 'FERDINANDA', 677889900, '11111111A', 'CO09', 5);

INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('88990011I', 'ISADORA', 688990011, '22222222E', 'CO10', 5);
INSERT INTO VENDEDOR (dni, nombre, telefono, supervisor, concesionario, porcent_ventas)
  VALUES('99001122O', 'OSVALDO', 699001122, '55555555U', 'CO11', 5);

SET CONSTRAINTS VEN_FK_VEN IMMEDIATE;
  
  
-- COCHES a la venta en los concesionarios. 
-- ** Todos los precios con valor 1. Despues se actualizara al valor correcto **
-- ** como se indica en el enunciado                                          **

-- En concesionarios TOYOTA
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO01', 'MA01', 'YARIS', 'VTYAAA1AA1A111101', 5, 1500, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO01', 'MA01', 'YARIS', 'VTYAAA2AA2A222202', 3, 1100, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO01', 'MA01', 'AURIS', 'VTAAAA1AA1A111103', 5, 1200, 1, '0000AAA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO01', 'MA01', 'AURIS', 'VTAAAA2AA2A222204', 3, 1190, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO01', 'MA01', 'RAV4', 'VTRAAA1AA1A111105', 4, 2400, 1, '0001AAB');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO01', 'MA01', 'LAND CRUISER', 'VTLCAA1AA1A111106', 5, 2800, 1, NULL);

INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO08', 'MA01', 'AURIS', 'VTABBB1BB1B111107', 5, 1190, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO08', 'MA01', 'RAV4', 'VTRBBB1BB1B111108', 5, 2400, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO08', 'MA01', 'RAV4', 'VTRBBB2BB2B222209', 3, 2400, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO08', 'MA01', 'RAV4', 'VTRBBB3BB3B333310', 3, 3500, 1, NULL);

INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO09', 'MA01', 'VERSO', 'VTVCCC1CC1C111111', 5, 1600, 1, '0010ABA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO09', 'MA01', 'LAND CRUISER', 'VTLCCC1CC1C111112', 3, 2500, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO09', 'MA01', 'LAND CRUISER', 'VTLCCC2CC2C222213', 4, 2800, 1, '0011BAA');

-- En concesionarios VOLKSWAGEN
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO02', 'MA02', 'POLO', 'VWPDDD1DD1D111114', 5, 1000, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO02', 'MA02', 'POLO', 'VWPDDD2DD2D222215', 3, 1100, 1, '0100AAC');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO02', 'MA02', 'VERSO', 'VWTDDD1DD1D111116', 5, 1400, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO02', 'MA02', 'VERSO', 'VWTDDD2DD2D222217', 4, 1500, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO02', 'MA02', 'VERSO', 'VWTDDD3DD3D333318', 3, 1400, 1, '0101ACA');

INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO10', 'MA02', 'POLO', 'VWPEEE1EE1E111119', 5, 1000, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO10', 'MA02', 'GOLF', 'VWGEEE1EE1E111120', 4, 1400, 1, NULL);

--En concesionarios OPEL
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO03', 'MA03', 'CORSA', 'VOCGGG1GG1G111121', 3, 1200, 1, '0110CAA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO03', 'MA03', 'CORSA', 'VOCGGG2GG2G222222', 5, 1200, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO03', 'MA03', 'CORSA', 'VOCGGG3GG3G333323', 3, 1500, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO03', 'MA03', 'CORSA', 'VOCGGG4GG4G444424', 3, 1200, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO03', 'MA03', 'CHEROKEE', 'VOMGGG1GG1G111125', 3, 1400, 1, '0111AAD');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO03', 'MA03', 'LAGUNA', 'VOIGGG1GG1G111126', 5, 2000, 1, NULL);

-- En concesionarios PEUGEOT
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO04', 'MA04', '208', 'VP208H1HH1H111127', 5, 1200, 1, '1000ADA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO04', 'MA04', '208', 'VP208H2HH2H222228', 4, 1200, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO04', 'MA04', '207', 'VP207H1HH1H111129', 3, 1400, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO04', 'MA04', '308', 'VP308H1HH1H111130', 5, 1200, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO04', 'MA04', '308', 'VP308H2HH2H222231', 3, 1500, 1, '1001DAA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO04', 'MA04', '3008', 'VP318H1HH1H111132', 5, 1600, 1, '1010AAE');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO04', 'MA04', '107', 'VP107H1HH1H111133', 5, 1000, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO04', 'MA04', '107', 'VP107H2HH2H222234', 3, 1000, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO04', 'MA04', '107', 'VP107H3HH3H333335', 4, 1000, 1, NULL);

-- En concesionarios RENAULT
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO05', 'MA05', 'TWINGO', 'VRTJJJ1JJ1J111136', 3, 1300, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO05', 'MA05', 'TWINGO', 'VRTJJJ2JJ2J222237', 5, 1200, 1, '1011AEA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO05', 'MA05', 'CLIO', 'VRCJJJ1JJ1J111138', 4, 1000, 1, '1100EAA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO05', 'MA05', 'LAGUNA', 'VRLJJJ1JJ1J111139', 5, 2000, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO05', 'MA05', 'MEGANE', 'VRMJJJ1JJ1J111140', 3, 1600, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO05', 'MA05', 'VERSO', 'VRSJJJ1JJ1J111141', 5, 1300, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO11', 'MA05', 'TWINGO', 'VRTJJJ3JJ3J333342', 4, 1300, 1, '1101AAF');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO11', 'MA05', 'TWINGO', 'VRTJJJ4JJ4J444443', 3, 1200, 1, NULL);

-- En concesionarios NISSAN
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO06', 'MA06', '207', 'VNLKKK1KK1K111144', 5, 1000, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO06', 'MA06', 'MICRA', 'VNMKKK1KK1K111145', 4, 1000, 1, '1110AFA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO06', 'MA06', 'MICRA', 'VNMKKK2KK2K222246', 3, 1000, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO06', 'MA06', 'MICRA', 'VNMKKK3KK3K333347', 5, 1000, 1, NULL);

INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO12', 'MA06', 'CHEROKEE', 'VNNPPP1PP1P111148', 5, 1200, 1, '1111FAA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO12', 'MA06', 'JUKE', 'VNJPPP1PP1P111149', 3, 1000, 1, '0000AAG');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO12', 'MA06', 'QASQAI', 'VNQPPP1PP1P111150', 4, 1300, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO12', 'MA06', 'QASQAI', 'VNQPPP2PP2P222251', 5, 1500, 1, NULL);

-- En concesionarios JEEP
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO07', 'MA07', 'CHEROKEE', 'VJCMMM1MM1M111152', 5, 2200, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO07', 'MA07', 'CHEROKEE', 'VJCMMM2MM2M222253', 3, 2200, 1, NULL);
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO07', 'MA07', 'WRANGLER', 'VJWMMM1MM1M111154', 5, 2000, 1, '0001AGA');
INSERT INTO COCHE (concesionario, marca, modelo, bastidor, puertas, cilindrada, pvp, matricula)
  VALUES('CO07', 'MA07', 'RENEGADE', 'VJRMMM1MM1M111155', 4, 1600, 1, '0010GAA');


-- Tabla COMERCIALIZA. Modelos comercializados por cada concesionario
-- TOYOTA: MODELOS COMERCIALIZADOS
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO01', 'MA01', 'YARIS', 10000.25);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO01', 'MA01', 'AURIS', 15000.15);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO01', 'MA01', 'RAV4', 26000.50);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO01', 'MA01', 'VERSO', 18000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO01', 'MA01', 'LAND CRUISER', 36500);

INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO08', 'MA01', 'YARIS', 11000.80);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO08', 'MA01', 'AURIS', 17000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO08', 'MA01', 'RAV4', 25500);

INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO09', 'MA01', 'RAV4', 25900);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO09', 'MA01', 'VERSO', 18500.75);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO09', 'MA01', 'LAND CRUISER', 36000);

-- VOLKSWAGEN: MODELOS COMERCIALIZADOS
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO02', 'MA02', 'POLO', 25000.50);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO02', 'MA02', 'GOLF', 35000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO02', 'MA02', 'PASSAT', 45000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO02', 'MA02', 'VERSO', 55000);

INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO10', 'MA02', 'POLO', 25000.99);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO10', 'MA02', 'GOLF', 36200);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO10', 'MA02', 'VERSO', 59000);

-- OPEL: MODELOS COMERCIALIZADOS
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO03', 'MA03', 'CORSA', 12000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO03', 'MA03', 'CHEROKEE', 16000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO03', 'MA03', '207', 18000.50);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO03', 'MA03', 'LAGUNA', 25000);

-- PEUGEOT: MODELOS COMERCIALIZADOS
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO04', 'MA04', '208', 14000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO04', 'MA04', '207', 25000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO04', 'MA04', '308', 17600.60);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO04', 'MA04', '3008', 21800);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO04', 'MA04', '107', 12000);

-- RENAULT: MODELOS COMERCIALIZADOS
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO05', 'MA05', 'TWINGO', 12100);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO05', 'MA05', 'CLIO', 12000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO05', 'MA05', 'LAGUNA', 22500.50);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO05', 'MA05', 'MEGANE', 15500);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO05', 'MA05', 'VERSO', 19000);

INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO11', 'MA05', 'TWINGO', 11700);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO11', 'MA05', 'CLIO', 12500);

-- NISSAN: MODELOS COMERCIALIZADOS
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO06', 'MA06', '207', 17500);	
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO06', 'MA06', 'MICRA', 12000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO06', 'MA06', 'CHEROKEE', 14500.99);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO06', 'MA06', 'JUKE', 17000);	
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO06', 'MA06', 'QASQAI', 21000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO12', 'MA06', 'JUKE', 17500);	
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO12', 'MA06', 'QASQAI', 21000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO12', 'MA06', 'CHEROKEE', 15000);
  
-- JEEP: MODELOS COMERCIALIZADOS
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO07', 'MA07', 'CHEROKEE', 40000.50);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO07', 'MA07', 'WRANGLER', 45000);
INSERT INTO COMERCIALIZA (concesionario, marca, modelo, precio_venta)
  VALUES ('CO07', 'MA07', 'RENEGADE', 50000);   
  

-- VENTAS DE COCHES
INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VTAAAA1AA1A111103', '11111111A', '56789012V', TO_DATE('01/01/2020', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VTRAAA1AA1A111105', '11111111A', '56789012V', TO_DATE('10/02/2021', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VTRBBB2BB2B222209', '88888888D', '12345678Z', TO_DATE('11/01/2021', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VTLCCC2CC2C222213', '99999999A', '34567890G', TO_DATE('07/03/2021', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VWPDDD2DD2D222215', '02222222E', '12345678Z', TO_DATE('19/07/2020', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VWTDDD3DD3D333318', '02222222E', '12345678Z', TO_DATE('20/04/2019', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VOCGGG1GG1G111121', '33333333I', '23456789Y', TO_DATE('23/03/2019', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VOMGGG1GG1G111125', '33333333I', '45678901W', TO_DATE('12/02/2018', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VP208H1HH1H111127', '04444444O', '45678901W', TO_DATE('22/02/2018', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VP308H2HH2H222231', '04444444O', '56789012V', TO_DATE('30/03/2017', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VP318H1HH1H111132', '04444444O', '56789012V', TO_DATE('30/05/2017', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VRTJJJ2JJ2J222237', '55555555U', '23456789Y', TO_DATE('31/01/2016', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VRCJJJ1JJ1J111138', '55555555U', '12345678Z', TO_DATE('02/02/2016', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VRTJJJ3JJ3J333342', '11211211E', '12345678Z', TO_DATE('18/04/2015', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VNMKKK1KK1K111145', '66666666M', '34567890G', TO_DATE('21/06/2015', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VNNPPP1PP1P111148', '05555555H', '23456789Y', TO_DATE('29/05/2019', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VNJPPP1PP1P111149', '55667788M', '56789012V', TO_DATE('09/11/2019', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VJWMMM1MM1M111154', '77777777C', '23456789Y', TO_DATE('29/05/2014', 'DD/MM/YYYY'));

INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VJRMMM1MM1M111155', '77777777C', '56789012V', TO_DATE('20/05/2014', 'DD/MM/YYYY'));
  

/*****************************************************************************
** SENTENCIAS PARA EL CALCULO DE LOS ATRIBUTOS "pvp" Y "num_vendedores"     **
******************************************************************************/
--PVP
UPDATE COCHE
    SET pvp = (SELECT precio_venta * 1.21
                FROM COMERCIALIZA
                WHERE concesionario = COCHE.concesionario
                AND modelo = COCHE.modelo
                AND marca = COCHE.marca);
--NUMERO VENDEDORES
UPDATE CONCESIONARIO
    SET num_vendedores = (SELECT COUNT(*)
                          FROM VENDEDOR
                          WHERE concesionario = CONCESIONARIO.codigo);
COMMIT;