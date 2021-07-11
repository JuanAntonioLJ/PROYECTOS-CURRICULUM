DROP TABLE CLIENTE cascade CONSTRAINTS;
DROP TABLE CONCESIONARIO cascade CONSTRAINTS;
DROP TABLE MODELO cascade CONSTRAINTS;
DROP TABLE COCHE cascade CONSTRAINTS;
DROP TABLE COMERCIALIZA cascade CONSTRAINTS;
DROP TABLE MARCA cascade CONSTRAINTS;
DROP TABLE VENDEDOR cascade CONSTRAINTS;
DROP TABLE VENTA cascade CONSTRAINTS;

CREATE TABLE CLIENTE(
    dni      VARCHAR(10)    PRIMARY KEY,
    nombre   VARCHAR(20)    NOT NULL,
    telefono NUMBER(15)     NOT NULL,
    cuenta   VARCHAR(30)
);
    
CREATE TABLE MARCA(
    idMarca                 VARCHAR(20) PRIMARY KEY,
    nombre                  VARCHAR(20) NOT NULL,
    concesionario_principal VARCHAR(20) NOT NULL
);

CREATE TABLE CONCESIONARIO(
    codigo          VARCHAR(20) PRIMARY KEY,
    nombre          VARCHAR(20) NOT NULL,
    direccion       VARCHAR(20) NOT NULL,
    telefono        NUMBER(15)  NOT NULL,
    num_vendedores  NUMBER(20)  NOT NULL,
    marca           VARCHAR(20) NOT NULL,
    CONSTRAINT con_fk_mar FOREIGN KEY (marca) REFERENCES MARCA(idmarca)
    --ON DELETE NO_ACTION
    --ON UPDATE CASCADE
);

ALTER TABLE MARCA
    ADD CONSTRAINT mar_fk_con 
        FOREIGN KEY (concesionario_principal) 
        REFERENCES CONCESIONARIO(codigo)
            --ON DELETE: NO ACTION
            --ON UPDATE: CASCADE
    INITIALLY IMMEDIATE DEFERRABLE;
        
CREATE TABLE VENDEDOR (
    dni                  VARCHAR(20)      PRIMARY KEY,
    nombre               VARCHAR(20)      NOT NULL,
    telefono             NUMBER(20)       NOT NULL,
    concesionario        VARCHAR(20)      NOT NULL,
    supervisor           VARCHAR(20),
    porcent_ventas       NUMBER(5,2)      NOT NULL,
    
    CONSTRAINT ven_fk_con FOREIGN KEY (concesionario) REFERENCES CONCESIONARIO(codigo),
    --ON DELETE NO ACTION
    --ON UPDATE CASCADE
    CONSTRAINT ven_fk_ven FOREIGN KEY (supervisor) REFERENCES VENDEDOR(dni)
    --ON DELETE SET NULL
    --ON UPDATE CASCADE
    INITIALLY IMMEDIATE DEFERRABLE,
    
    CHECK (dni != supervisor),
    CHECK (porcent_ventas > 0 AND porcent_ventas < 100)
);

CREATE TABLE MODELO (
    marca                   VARCHAR(20),
    nombre                  VARCHAR(20),
    PRIMARY KEY (marca, nombre),
    precio_recomendado      NUMBER(7,2)     NOT NULL,
    CONSTRAINT mod_fk_mar FOREIGN KEY (marca) REFERENCES MARCA(idmarca),
    --ON DELETE NO ACTION
    --ON UPDATE CASCADE
    CHECK (precio_recomendado > 0)
);

CREATE TABLE COCHE(
    concesionario                VARCHAR(20)      NOT NULL,
    marca                        VARCHAR(20)      NOT NULL,
    modelo                       VARCHAR(20)      NOT NULL,
    bastidor                     VARCHAR(20)      PRIMARY KEY,
    puertas                      NUMBER(6)        NOT NULL,
    cilindrada                   NUMBER(5)        NOT NULL,
    pvp                          NUMBER(7, 2)     NOT NULL,
    matricula                    VARCHAR(20)      UNIQUE NULL,
    
    CONSTRAINT coc_fk_mod FOREIGN KEY (marca, modelo) REFERENCES MODELO(marca, nombre)
    --ON DELETE NO_ACTION
    --ON UPDATE CASCADE
    INITIALLY IMMEDIATE DEFERRABLE,
    
    CONSTRAINT coc_fk_con FOREIGN KEY (concesionario) REFERENCES CONCESIONARIO(codigo),
    --ON DELETE NO_ACTION
    --ON UPDATE CASCADE
    CHECK(puertas > 2 AND puertas < 6)
);
    
    
CREATE TABLE COMERCIALIZA(
    concesionario VARCHAR(20)   NOT NULL,
    modelo        VARCHAR (20)  NOT NULL,
    marca         VARCHAR(20)   NOT NULL,
    PRIMARY KEY(concesionario, modelo, marca),
    precio_venta  NUMBER(9)     NOT NULL,
    
     CONSTRAINT com_fk_con FOREIGN KEY (concesionario) REFERENCES CONCESIONARIO(codigo),
    --ON DELETE NO_ACTION
    --ON UPDATE NO_ACTION
    CONSTRAINT com_fk_mod FOREIGN KEY (modelo, marca) REFERENCES MODELO(nombre, marca)
    --ON DELETE NO_ACTION
    --ON UPDATE NO_ACTION
    INITIALLY IMMEDIATE DEFERRABLE,

    
    CHECK (precio_venta > 0)
);

CREATE TABLE VENTA(
    vendedor    VARCHAR(10)    NOT NULL,
    cliente     VARCHAR(10)    NOT NULL,
    coche       VARCHAR(20)    PRIMARY KEY,
    fecha_venta DATE           NOT NULL,
    CONSTRAINT vent_fk_ven FOREIGN KEY (vendedor) REFERENCES VENDEDOR(dni),
    --ON DELETE NO ACTION
    --ON UPDATE NO ACTION
    CONSTRAINT vent_fk_cli FOREIGN KEY (cliente) REFERENCES CLIENTE(dni),
    --ON DELETE NO ACTION
    --ON UPDATE NO ACTION
    CONSTRAINT vent_fk_coc FOREIGN KEY (coche) REFERENCES COCHE(bastidor)
    --ON DELETE NO ACTION
    --ON UPDATE NO ACTION  
);

