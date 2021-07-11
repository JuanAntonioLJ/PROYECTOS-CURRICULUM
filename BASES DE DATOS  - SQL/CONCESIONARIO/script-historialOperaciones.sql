

COMMENT ON TABLE MARCA IS
    'Esta tabla almacena los datos de necesarios para identificar una marca de modelos de coches.';
SELECT *
FROM USER_TAB_COMMENTS
WHERE table_name = 'MARCA';


COMMENT ON COLUMN MARCA.idmarca IS
    'Este es el identificador con el que cada marca se identifica de las demas, siendo el unico atributo que no puede repetirse entre marcas diferentes.';
COMMENT ON COLUMN MARCA.nombre IS
    'Este es el nombre con el que se conoce normalmente a la marca.';
COMMENT ON COLUMN MARCA.concesionario_principal IS
    'Este es el concesionario principal de la marca.';
    

SELECT *
FROM USER_COL_COMMENTS
WHERE table_name = 'MARCA';


SELECT dni, v.nombre, c.nombre, porcent_ventas
FROM VENDEDOR v, CONCESIONARIO c
WHERE concesionario=codigo
ORDER BY c.nombre, v.nombre; 


UPDATE VENDEDOR
    SET porcent_ventas = porcent_ventas +15
WHERE concesionario = (
    SELECT codigo 
    FROM (SELECT c.codigo AS codigo, COUNT(*) AS ventas
        FROM VENTA a, VENDEDOR b, CONCESIONARIO C
        WHERE a.vendedor = b.dni
        AND b.concesionario = c.codigo
        GROUP BY c.codigo
        ORDER BY ventas desc)
    
    WHERE ROWNUM = 1 );


COMMIT;
    

ROLLBACK;


SET CONSTRAINTS COC_FK_MOD DEFERRED;
SET CONSTRAINTS COM_FK_MOD DEFERRED;


UPDATE MODELO 
    SET nombre = 'e-RAV4'
WHERE nombre = 'RAV4';


UPDATE COCHE
    SET modelo = 'e-RAV4'
WHERE modelo = 'RAV4';


UPDATE COMERCIALIZA
    SET modelo = 'e-RAV4'
WHERE modelo = 'RAV4';


SET CONSTRAINTS COM_FK_MOD IMMEDIATE;
SET CONSTRAINTS COC_FK_MOD IMMEDIATE;


SELECT m.nombre, m.marca, m.precio_recomendado
FROM MODELO m, COMERCIALIZA e, COCHE i
WHERE e.modelo = nombre
AND i.modelo = nombre
AND nombre = 'e-RAV4';


COMMIT;


SELECT dni ,nombre ,concesionario, supervisor
FROM VENDEDOR
WHERE concesionario = 'CO01'
OR concesionario = 'CO02';


DELETE FROM VENTA
    WHERE vendedor IN (SELECT dni 
                        FROM VENDEDOR
                        WHERE concesionario = 'CO01'
                        OR concesionario = 'CO02');
                      
  
UPDATE VENDEDOR
    SET nombre = CONCAT('*', nombre)
WHERE concesionario = 'CO01';


UPDATE VENDEDOR 
    SET concesionario = 'CO02'
WHERE concesionario = 'CO01';


UPDATE VENDEDOR 
    SET concesionario = 'CO01'
WHERE concesionario = 'CO02'
AND 1 != INSTR(nombre, '*') ;


UPDATE VENDEDOR
    SET nombre = SUBSTR(nombre,2,LENGTH(nombre))
WHERE 1 = INSTR(nombre, '*');


SELECT dni ,nombre ,concesionario, supervisor
FROM VENDEDOR
WHERE concesionario = 'CO01'
OR concesionario = 'CO02';
    

ROLLBACK;


DELETE FROM VENTA 
WHERE EXTRACT (YEAR FROM fecha_venta)<2017 
    AND vendedor IN (SELECT dni
                    FROM VENDEDOR
                    WHERE supervisor IS NULL) 
    AND coche IN (SELECT bastidor
                 FROM COCHE
                 WHERE pvp<14600);
COMMIT;

    
    DELETE FROM VENDEDOR 
    WHERE concesionario IN (SELECT codigo
                            FROM CONCESIONARIO
                            WHERE marca = 'MA01');
 
                           
DELETE FROM COCHE
    WHERE concesionario IN (SELECT codigo
                            FROM CONCESIONARIO
                            WHERE marca ='MA01');

                            
DELETE FROM COMERCIALIZA
    WHERE marca = 'MA01';

    
DELETE FROM MODELO
    WHERE marca = 'MA01';

    
SET CONSTRAINTS MAR_FK_CON DEFERRED;


DELETE FROM CONCESIONARIO
        WHERE marca = 'MA01';

    
DELETE FROM MARCA
    WHERE idMarca='MA01';

    
SET CONSTRAINTS MAR_FK_CON IMMEDIATE;


COMMIT;


SELECT *
FROM CLIENTE;


ALTER TABLE CLIENTE DROP COLUMN  telefono;


ALTER TABLE CLIENTE DROP COLUMN  cuenta;


ALTER TABLE CLIENTE DROP (telefono, cuenta);


CREATE OR REPLACE VIEW VENTAS_MARCA (marca, año, mes, coches_vendidos, total_venta, media_pvp)
AS SELECT marca, EXTRACT(YEAR FROM fecha_venta), TO_CHAR(fecha_venta,'MONTH'), COUNT(*), SUM(pvp), AVG(pvp)
FROM VENTA, COCHE
WHERE coche=bastidor 
GROUP BY marca, EXTRACT(YEAR FROM fecha_venta), TO_CHAR(fecha_venta,'MONTH');


SELECT *
FROM VENTAS_MARCA
ORDER BY marca, año, mes;


CREATE OR REPLACE VIEW VENTAS_MARCA (marca, año, mes, coches_vendidos, total_venta)
AS SELECT marca, EXTRACT(YEAR FROM fecha_venta), TO_CHAR(fecha_venta,'MONTH'), COUNT(*), SUM(pvp)
FROM VENTA, COCHE
WHERE coche=bastidor 
GROUP BY marca, EXTRACT(YEAR FROM fecha_venta), TO_CHAR(fecha_venta,'MONTH');


SELECT *
FROM VENTAS_MARCA
ORDER BY marca, año, mes;


CREATE OR REPLACE VIEW VENTAS_MARCA (marca, año, mes, coches_vendidos, total_venta)
AS SELECT marca, EXTRACT(YEAR FROM fecha_venta), TO_CHAR(fecha_venta,'MONTH'), COUNT(*), (1.03)*SUM(pvp)
FROM VENTA, COCHE
WHERE coche=bastidor 
GROUP BY marca, EXTRACT(YEAR FROM fecha_venta), TO_CHAR(fecha_venta,'MONTH');


SELECT *
FROM VENTAS_MARCA
ORDER BY marca, año, mes;


INSERT INTO VENTA (coche, vendedor, cliente, fecha_venta)
  VALUES('VTVCCC1CC1C111111', '99999999A', '45678901W', TO_DATE('20/05/2011', 'DD/MM/YYYY'));


COMMIT;


SELECT *
FROM VENTAS_MARCA
ORDER BY marca, año, mes;


SELECT codigo, nombre
FROM CONCESIONARIO 
WHERE codigo NOT IN(SELECT concesionario
                    FROM VENDEDOR);

                    
SELECT idMarca, nombre
FROM MARCA 
WHERE idMarca NOT IN(SELECT marca
                    FROM MODELO);


SELECT idMarca, nombre
FROM MARCA m 
WHERE concesionario_principal IN(SELECT codigo
                                     FROM CONCESIONARIO
                                     WHERE codigo = m.concesionario_principal
                                     AND marca != m.idmarca);
                                     
                                     
                                     