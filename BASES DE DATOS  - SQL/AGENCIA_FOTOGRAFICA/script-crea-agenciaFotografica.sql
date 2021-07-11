
--
-- Destruccion (DROP) de tablas del esquema 
-- Además, permite ejecuciones repetidas de este script
-- Logicamente, la primera ejecución da error

DROP TABLE VENTAREPOR;
DROP TABLE SUSCRIPCION;
DROP TABLE EXCLUSIVA;
DROP TABLE REPORTAJE;
DROP TABLE FOTOGRAFO;
DROP TABLE EDITORIAL;
DROP TABLE TEMA;


-- CREACION de las tablas del esquema AGENCIAFOTOGRAFICA

CREATE TABLE FOTOGRAFO
(	codfot		CHAR(5) 	 NOT NULL,
	nombre		VARCHAR2(20) NOT NULL,
	direccion	VARCHAR2(15) NOT NULL,
	email		VARCHAR2(15),
	CONSTRAINT pk_fotografo PRIMARY KEY(codfot) );

CREATE TABLE EDITORIAL
(	codedi		  CHAR(5)	   NOT NULL,
	nombre 		  VARCHAR2(15) NOT NULL,
	direccion	  VARCHAR2(15) NOT NULL,
	email		  VARCHAR2(20),
	fechacontrato DATE		   NOT NULL,
	cuota		  NUMBER(5,2)  NOT NULL,
	CONSTRAINT pk_editorial PRIMARY KEY(codedi) );

CREATE TABLE TEMA
(	codtem		CHAR(4)		 NOT NULL,
	descripcion	VARCHAR2(25) NOT NULL,
	CONSTRAINT pk_tema PRIMARY KEY(codtem) );

CREATE TABLE SUSCRIPCION
(	editorial 		 CHAR(5) NOT NULL,
 	tema			 CHAR(4) NOT NULL,
	fechasuscripcion DATE 	 NOT NULL,
	CONSTRAINT pk_suscripcion PRIMARY KEY(editorial, tema),
	CONSTRAINT suscripcion_fk_tema 
		FOREIGN KEY(tema) REFERENCES TEMA(codtem),
	CONSTRAINT suscripcion_fk_editorial 
		FOREIGN KEY(editorial) REFERENCES EDITORIAL(codedi) );

CREATE TABLE EXCLUSIVA
(	codexc	  CHAR(6) 	NOT NULL,
	titulo	  VARCHAR2(45),
	tema	  CHAR(4) 	NOT NULL,
	fotografo CHAR(5),
	editorial CHAR(5) 	NOT NULL,
	peticion  DATE 		NOT NULL,
	entrega   DATE,
	precio    NUMBER(5,2),
	CONSTRAINT pk_exclusiva PRIMARY KEY(codexc),
	CONSTRAINT exclusiva_fk_editorial 
		FOREIGN KEY(editorial) REFERENCES EDITORIAL(codedi),
	CONSTRAINT exclusiva_fk_fotografo
		FOREIGN KEY(fotografo) REFERENCES FOTOGRAFO(codfot),
	CONSTRAINT exclusiva_fk_tema 
		FOREIGN KEY(tema) REFERENCES TEMA(codtem) );

CREATE TABLE REPORTAJE
(	codrep 		CHAR(6) 	NOT NULL,
	titulo 		VARCHAR2(45),
	tema 		CHAR(4) 	NOT NULL,
	fotografo	CHAR(5) 	NOT NULL,
	entrega 	DATE 		NOT NULL,
	precio		NUMBER(5,2) NOT NULL,
	CONSTRAINT pk_reportaje PRIMARY KEY(codrep),
	CONSTRAINT reportaje_fk_fotografo 
		FOREIGN KEY(fotografo) REFERENCES FOTOGRAFO(codfot),
	CONSTRAINT reportaje_fk_tema 
		FOREIGN KEY(tema) REFERENCES TEMA(codtem) );

CREATE TABLE VENTAREPOR
(	editorial CHAR(5) NOT NULL,
	reportaje CHAR(6) NOT NULL,
	fecha 	  DATE 	  NOT NULL,
	CONSTRAINT pk_ventarepor PRIMARY KEY(editorial, reportaje),
	CONSTRAINT ventarepor_fk_editorial 
		FOREIGN KEY(editorial) REFERENCES EDITORIAL(codedi),
	CONSTRAINT ventarepor_fk_reportaje 
		FOREIGN KEY(reportaje) REFERENCES REPORTAJE(codrep) );


-- INSERCION de datos en las tablas

-- 8 editoriales
INSERT INTO EDITORIAL(codedi, nombre, direccion, email, fechacontrato, cuota)
VALUES ('ED000', 'BRUGARA', 'VELAZQUEZ,30', 'brugara@edi.es', 
to_date('10/10/2014','dd/mm/yyyy'),150.25);

INSERT INTO EDITORIAL(codedi, nombre, direccion, email, fechacontrato, cuota)
VALUES ('ED010', 'PLATA Y JONES', 'DALI,17', 'platajones@edi.es', 
	to_date('04/9/2015','dd/mm/yyyy'),180.3);

INSERT INTO EDITORIAL(codedi, nombre, direccion, email, fechacontrato, cuota)
VALUES ('ED112', 'ESAEME', 'SOROLLA,106', 'esaeme@edi.es', 
	to_date('29/08/2018','dd/mm/yyyy'),132.22);

INSERT INTO EDITORIAL(codedi, nombre, direccion, email, fechacontrato, cuota)
VALUES ('ED001', 'ALFAWARA', 'MURILLO,2', 'alfawara@edi.es', 
	to_date('10/12/2010','dd/mm/yyyy'),195.33);

INSERT INTO EDITORIAL(codedi, nombre, direccion, email, fechacontrato, cuota)
VALUES ('ED222', 'MANTILLANA', 'GOYA,22', 'mantillana@.edi.es', 
	to_date('14/09/2016','dd/mm/yyyy'),120.2);

INSERT INTO EDITORIAL(codedi, nombre, direccion, email, fechacontrato, cuota)
VALUES ('ED110', 'PLANETO', 'PICASSO,32', 'planeto@edi.es', 
	to_date('13/04/2015','dd/mm/yyyy'),120.2);

INSERT INTO EDITORIAL(codedi, nombre, direccion, email, fechacontrato, cuota)
VALUES ('ED221', 'ESPESACALPE', 'ZURBARAN,50', 'espesacalpe@edi.es', 
	to_date('31/01/2016','dd/mm/yyyy'),132.22);

INSERT INTO EDITORIAL(codedi, nombre, direccion, email, fechacontrato, cuota)
VALUES ('ED111', 'SELVAT', 'MIRO,43', 'selvat@edi.es', 
	to_date('25/09/2017','dd/mm/yyyy'),162.27);

-- 7 fotografos
INSERT INTO FOTOGRAFO(codfot, nombre, direccion, email)
VALUES ('F2211', 'CASTELLANO, MANUEL', 'MONTES, 2', 'maca@mail.com');

INSERT INTO FOTOGRAFO(codfot, nombre, direccion, email)
VALUES ('F1020', 'URZAY, DARIO', 'OCEANOS, 40', 'daur@mail.com');

INSERT INTO FOTOGRAFO(codfot, nombre, direccion, email)
VALUES ('F5430', 'GALLO, ISIDORO', 'TIERRAS, 15', 'isga@mail.com');

INSERT INTO FOTOGRAFO(codfot, nombre, direccion, email)
VALUES ('F1101', 'G.BUÑUEL, MARGARITA', 'OLIVO, 150', 'magb@mail.com');

INSERT INTO FOTOGRAFO(codfot, nombre, direccion, email)
VALUES ('F2202', 'LELE, OUKA', 'ECLIPSE, 10', 'oule@mail.com');

INSERT INTO FOTOGRAFO(codfot, nombre, direccion, email)
VALUES ('F2212', 'MASATS, RAMON', 'PAZ, 161', 'rama@mail.com');

INSERT INTO FOTOGRAFO(codfot, nombre, direccion, email)
VALUES ('F1010', 'NAVARRO, FERNANDO', 'VIENTOS,25', 'fena@mail.com');

-- 13 temas 
INSERT INTO TEMA(codtem, descripcion)
VALUES ('T004', 'CIENCIA Y NATURALEZA');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T001', 'ARTE Y CULTURA');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T010', 'GUERRA');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T002', 'OVNIS Y EXTRATERRESTRES');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T007', 'LITERATURA');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T003', 'POLITICA');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T005', 'INFORMATICA');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T012', 'MUSICA');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T006', 'HISTORIA');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T008', 'CINE');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T000', 'VARIOS');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T011', 'DEPORTES');

INSERT INTO TEMA(codtem, descripcion)
VALUES ('T009', 'FEMINISMO');

-- 55 Suscripciones de las editoriales a los temas

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T002','ED000', to_date('10/10/2014','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T007','ED000', to_date('10/10/2014','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T012','ED000', to_date('21/01/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T001','ED111', to_date('25/09/2017','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T009','ED111', to_date('20/10/2017','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T009','ED001', to_date('10/12/2010','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T002','ED001', to_date('10/12/2010','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T001','ED001', to_date('10/10/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION (tema, editorial, fechasuscripcion)
VALUES ('T010','ED001', to_date('03/08/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T004','ED221', to_date('31/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T002','ED221', to_date('01/02/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T005','ED221', to_date('31/10/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T012','ED221', to_date('31/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T000','ED010', to_date('04/09/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T001','ED010', to_date('01/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T002','ED010', to_date('04/09/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T003','ED010', to_date('01/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T004','ED010', to_date('01/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T005','ED010', to_date('04/09/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T006','ED010', to_date('01/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T007','ED010', to_date('16/04/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T008','ED010', to_date('01/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T009','ED010', to_date('18/08/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T010','ED010', to_date('01/12/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T011','ED010', to_date('13/11/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T012','ED010', to_date('01/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T001','ED110', to_date('01/05/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T004','ED110', to_date('14/04/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T002','ED110', to_date('04/09/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T003','ED110', to_date('01/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T005','ED110', to_date('14/04/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T000','ED110', to_date('14/04/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T006','ED110', to_date('01/05/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T007','ED110', to_date('16/04/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T008','ED110', to_date('01/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T011','ED110', to_date('19/11/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T009','ED110', to_date('18/08/2017','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T010','ED110', to_date('01/12/2015','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T012','ED110', to_date('21/01/2016','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T000','ED112', to_date('29/08/2018','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T001','ED112', to_date('01/10/2018','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T004','ED112', to_date('14/04/2019','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T005','ED112', to_date('14/04/2019','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T006','ED112', to_date('23/05/2019','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T007','ED112', to_date('11/02/2019','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T009','ED112', to_date('28/08/2019','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T008','ED112', to_date('01/01/2019','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T010','ED112', to_date('01/12/2018','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T002','ED112', to_date('04/09/2018','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T003','ED112', to_date('29/08/2018','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T011','ED112', to_date('19/11/2018','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T012','ED112', to_date('21/01/2019','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T004','ED222', to_date('10/10/2018','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T008','ED222', to_date('14/08/2018','dd/mm/yyyy'));

INSERT INTO SUSCRIPCION(tema, editorial, fechasuscripcion)
VALUES ('T005','ED222', to_date('16/08/2018','dd/mm/yyyy'));

-- 27 reportajes
INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP0030', 'T003', 'CRISPACION EN LOS ESCAÑOS DEL CONGRESO', 'F1020', 
	to_date('24/11/2018','dd/mm/yyyy'), 90.15);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP1515', 'T009', 'FEMINISMO EN LA RED', 'F2211', 
	to_date('05/10/2018','dd/mm/yyyy'), 324.55);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP9696', 'T011', 'EUROCOPA FEMENINA 2021', 'F5430', 
	to_date('20/02/2021','dd/mm/yyyy'), 480.81);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP0105', 'T004', 'LAS ULTIMAS BALLENAS', 'F5430', 
	to_date('03/04/2016','dd/mm/yyyy'), 120.2);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP2040', 'T004', 'DESASTRES E INUNDACIONES', 'F1020', 
	to_date('15/10/2018','dd/mm/yyyy'), 318.54);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP0333', 'T003', 'POLÍTICAS DE LA UNION EUROPEA', 'F2211', 
	to_date('12/07/2018','dd/mm/yyyy'), 282.48);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP1017', 'T010', 'CONFLICTO ISRAEL-PALESTINA', 'F1020', 
	to_date('22/11/2018','dd/mm/yyyy'), 450.76);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP0002', 'T003', 'HUELGA DE CAMIONEROS', 'F1010', 
	to_date('20/10/2018','dd/mm/yyyy'), 150.25);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP1313', 'T001', 'EXPOSICIÓN DE OBRAS DE EULALIA FABREGAS', 'F5430', 
	to_date('08/01/2018','dd/mm/yyyy'), 60.1);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP1826', 'T002', 'OVNIS AVISTADOS EN MURCIA', 'F1101', 
	to_date('07/07/2016','dd/mm/yyyy'), 721.21);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP0015', 'T008', 'SEMANA INTERNACIONAL DE CINE DE VALLADOLID', 'F2211',
	to_date('30/09/2018','dd/mm/yyyy'), 360.61);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP2525', 'T003', 'ESTADISTICA DE LA ASISTENCIA AL PARLAMENTO', 'F1010',
	to_date('12/08/2018','dd/mm/yyyy'), 264.45);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP3003', 'T009', 'PIONERAS DEL FEMINISMO', 'F1020', 
	to_date('04/04/2018','dd/mm/yyyy'), 270.46);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP2340','T001','FAMOSOS RETOCADOS EN QUIROFANO', 'F1020',
	to_date('20/07/2015','dd/mm/yyyy'), 60.1);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP3030','T003','RESUMEN DEL DEBATE PRESUPUESTARIO', 'F1020',
	to_date('05/05/2016','dd/mm/yyyy'), 999.02);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP4040','T004','VIAJE AL KILIMANJARO', 'F1020',
	to_date('02/02/2018','dd/mm/yyyy'), 601.01);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio)
VALUES ('RP4460','T009','LA LUCHA POR EL VOTO FEMENINO', 'F1020',
	to_date('03/07/2018','dd/mm/yyyy'), 601.01);
	
INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP4120','T005','TELEGRAM SE COME A WHATSAPP', 'F1020',
	to_date('05/04/2020','dd/mm/yyyy'), 120.2);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP4230','T006','LAS VICTIMAS DEL NAZISMO', 'F1020',
	to_date('20/04/2018','dd/mm/yyyy'), 120.2);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP4240','T007','NUEVA NOVELA DE GEORGE R.R. MARTIN', 'F1020',
	to_date('25/04/2018','dd/mm/yyyy'), 300.51);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP4550','T012','LO MEJOR DE SABINA', 'F1020',
	to_date('16/04/2020','dd/mm/yyyy'), 601.01);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP4450','T008','ALMODOVAR A LA CAZA DEL OSCAR', 'F1020',
	to_date('03/06/2018','dd/mm/yyyy'), 360.61);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP4480','T010', 'AFGANISTAN: LA GUERRA OCULTA', 'F1020',
	to_date('12/10/2018','dd/mm/yyyy'), 601.01);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP2370','T002','¿LA VERDAD ESTA AHI FUERA?', 'F1020',
	to_date('04/12/2015','dd/mm/yyyy'), 180.3);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP4490','T011','LOS MEJORES MOMENTOS OLIMPICOS', 'F1020',
	to_date('24/11/2018','dd/mm/yyyy'), 601.01);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP1110','T000','PANICO EN LA SEMANA SANTA SEVILLANA', 'F1020',
	to_date('01/05/2016','dd/mm/yyyy'), 150.25);

INSERT INTO REPORTAJE(codrep, tema, titulo, fotografo, entrega, precio) 
VALUES ('RP5550','T012','EXITO EN EL FESTIVAL DE BENICASSIM', 'F2202',
	to_date('01/08/2020','dd/mm/yyyy'), 225.75);

-- ventas de reportajes a editoriales
INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED222', 'RP0002', to_date('30/10/2018','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED001', 'RP1313', to_date('09/02/2018','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED222', 'RP0015', to_date('02/10/2018','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED001', 'RP1017',  to_date('25/11/2018','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED110', 'RP1017', to_date('24/11/2018','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED221', 'RP3003', to_date('16/05/2018','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED111', 'RP1313', to_date('10/02/2018','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED001', 'RP3003', to_date('19/05/2018','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED222', 'RP2040', to_date('17/10/2018','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED111', 'RP9696', to_date('27/12/2017','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED001', 'RP1826', to_date('14/08/2016','dd/mm/yyyy'));

INSERT INTO VENTAREPOR(editorial, reportaje, fecha)
VALUES ('ED111', 'RP3003', to_date('18/05/2018','dd/mm/yyyy'));

-- exclusivas
INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX1122','ED000','T007','ENTREGA DEL NOBEL DE LITERATURA','F1020',
	to_date('21/02/2018','dd/mm/yyyy'),to_date('02/03/2018','dd/mm/yyyy'),250.5);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX2345','ED221','T012','QUE FUE DE LA CANCION PROTESTA?','F2202',
	to_date('07/07/2018','dd/mm/yyyy'), to_date('08/07/2018','dd/mm/yyyy'),180.3);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX0149','ED111','T001','LA AZAROSA VIDA DE SALVADOR DALI',NULL,
	to_date('01/12/2018','dd/mm/yyyy'),NULL,NULL);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX0002','ED222','T005','HUELGA ESTUDIANTIL EN LA FAC. DE INFORMATICA','F1101',
	to_date('27/09/2019','dd/mm/yyyy'),to_date('30/09/2019','dd/mm/yyyy'),190);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX0001','ED111','T001','ARTISTAS DE MURCIA CON PROYECCION MUNDIAL','F2212',
	to_date('03/10/2017','dd/mm/yyyy'),to_date('04/11/2017','dd/mm/yyyy'),999.02);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX2255','ED000','T008','ESTRENOS DE CINE EN SEMANA SANTA','F2212',
	to_date('21/11/2018','dd/mm/yyyy'),to_date('22/12/2018','dd/mm/yyyy'),510.86);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX0102','ED221','T005','APPLE DESPUES DE S. JOBS',NULL,
	to_date('07/02/2018','dd/mm/yyyy'),NULL,NULL);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX1000','ED000','T012','MACROCONCIERTO DE U2','F1020',
	to_date('18/06/2018','dd/mm/yyyy'),NULL,400);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX1797','ED000','T002','ABDUCCION EN EL CAMPUS DE ESPINARDO!','F1101',
	to_date('08/11/2018','dd/mm/yyyy'),NULL,602);
	
INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX2552','ED222','T004','TREMENDA INUNDACION EN GALICIA',NULL,
	to_date('24/11/2018','dd/mm/yyyy'),NULL,NULL);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX1010','ED111','T001','EL ARTE EN LA MODA: VESTIDOS DE AUTOR','F2202',
	to_date('01/10/2018','dd/mm/yyyy'),NULL,504);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX0020','ED111','T011','ANTOLOGIA DE PIFIAS ARBITRALES','F2212',
	to_date('03/12/2017','dd/mm/yyyy'), to_date('15/01/2018','dd/mm/yyyy'),450.76);

INSERT INTO EXCLUSIVA
(codexc,editorial,tema,titulo,fotografo,peticion,entrega,precio)
VALUES ('EX1020','ED000','T007','GANADORES DEL PREMIO PLANETA',NULL,
	to_date('21/11/2018','dd/mm/yyyy'),NULL,NULL);

-- Confirmación en disco de los cambios realizados (inserciones) 
COMMIT;
-- fin script creacion y carga de esquema AGENCIAFOTOGRAFICA