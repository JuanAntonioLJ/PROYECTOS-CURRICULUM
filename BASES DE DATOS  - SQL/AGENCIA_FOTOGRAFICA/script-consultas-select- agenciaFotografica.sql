-- Consulta 1. Temas (codtem) de los cuales no se ha entregado ninguna exclusiva ni se ha vendido ning�n
-- reportaje.
(SELECT codtem
 FROM TEMA)
MINUS
((SELECT tema
FROM REPORTAJE
WHERE codrep IN (SELECT reportaje
                FROM VENTAREPOR))
UNION 
(SELECT tema
FROM EXCLUSIVA
WHERE entrega IS NOT NULL));


-- Consulta 2. Fotografos (codfot, nombre, email) que han hecho todos sus reportajes del mismo tema,
-- indicando cu�l es dicho tema (tema) y cu�ntos reportajes ha hecho (num_repor). Ordenado por
-- nombre del fot�grafo.
SELECT codfot, nombre, email, tema, num_repor
FROM FOTOGRAFO F,
    (SELECT fotografo, COUNT(*) num_report
    FROM REPORTAJE
    GROUP BY fotografo) Z,
    (SELECT fotografo, tema, COUNT(*) num_repor
    FROM REPORTAJE
    GROUP BY fotografo, tema) W 
WHERE codfot = Z.fotografo 
    AND codfot = W.fotografo 
    AND num_repor = num_report
ORDER BY nombre;



-- Consulta 3 El fot�grafo (codfot, nombre) que m�s exclusivas ha entregado (comparado con el resto de
-- fot�grafos), y cu�ntas han sido (num_exclu).
--OPCION A -M�s elegate
SELECT codfot, nombre, COUNT(*) num_exclu
FROM EXCLUSIVA, FOTOGRAFO
WHERE entrega IS NOT NULL
    AND fotografo = codfot
GROUP BY codfot, nombre
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                FROM EXCLUSIVA
                WHERE entrega IS NOT NULL
                GROUP BY fotografo);

-- OPCION B
SELECT codfot, nombre, num_exclu
FROM FOTOGRAFO, (SELECT fotografo, COUNT(*) num_exclu
                FROM EXCLUSIVA
                WHERE entrega IS NOT NULL
                GROUP BY fotografo)
WHERE codfot = fotografo AND
    num_exclu = (SELECT MAX(COUNT(*))
                FROM EXCLUSIVA
                WHERE entrega IS NOT NULL
                GROUP BY fotografo);


-- Consulta 4: La primera exclusiva (codexc) que se ha pedido de cada tema (descripcion), y en qu� fecha (petici�n).
-- En la columna �petici�n�, el mes debe mostrarse en letras may�sculas. Ordenado por el c�digo de tema.
SELECT X.codexc, descripcion, TO_CHAR(X.peticion,'dd/MONTH/yyyy') peticion
FROM TEMA , EXCLUSIVA X, 
    -- Agrupamos las exclusivas por temas, obteniendo una tabla con dos columnas, donde la segunda corresponde 
    -- con la petici�n de exclusiva m�s antigua que se ha hecho sobre un determinado tema. 
    (SELECT tema, MIN(peticion) pet  
     FROM EXCLUSIVA
     GROUP BY tema) C
WHERE C.tema = X.tema AND
    C.pet = X.peticion AND
    codtem = X.tema
ORDER BY X.tema;


-- Consulta 5: C�digo de las editoriales (editorial) que han adquirido reportajes y/o solicitado exclusivas de
-- temas a los que no est�n suscritas, indicando cu�ntos son esos reportajes y/o exclusivas (num).
-- Ordenado por c�digo de editorial.
SELECT editorial, COUNT(*) num 
FROM (
   (SELECT editorial
    FROM VENTAREPOR, REPORTAJE 
    WHERE reportaje = codrep
    AND (editorial,tema) NOT IN (SELECT editorial, tema
                                 FROM SUSCRIPCION))
    UNION ALL
    (SELECT editorial
    FROM EXCLUSIVA 
    WHERE (editorial,tema) NOT IN (SELECT editorial, tema
                                    FROM SUSCRIPCION)))
GROUP BY editorial
ORDER BY editorial;


-- Consulta 6. Obtener la cantidad de dinero (precio) que generar�n a la agencia las exclusivas pendientes de
-- entrega que han sido pedidas por editoriales con m�s de 5 a�os de contrato (editorial),
-- indicando tambi�n el fot�grafo asignado a cada exclusiva (codfot, nombre).
SELECT precio, editorial, codfot, F.nombre
FROM EXCLUSIVA , FOTOGRAFO F, EDITORIAL
WHERE codfot = fotografo
    AND codedi = editorial
    AND entrega IS NULL 
    AND (SYSDATE - fechacontrato) > 1825
 ORDER BY F.nombre;


-- Consulta 7. Editoriales (codedi,nombre) que est�n suscritas a todos los temas.
-- OPCION A y mejor opci�n. DIVISION. Convertimos la oraci�n a negativa->
-- Editoriales tales que no existe un tema al que no est�n suscritos.
SELECT codedi, nombre
FROM  EDITORIAL 
WHERE NOT EXISTS 
    (SELECT *
     FROM TEMA
     WHERE codtem NOT IN (SELECT tema
                          FROM SUSCRIPCION
                          WHERE editorial = codedi));


-- OPCION B. Resultado v�lido pero implementaci�n de la consulta 
-- muy chapucera. Esta se hizo en un princio antes de hacer la opci�n A, 
-- Se declara una especie de constante (numtemas) que nos indica el 
-- n�mero de temas. Utilizamos DISTINCT para evitar duplicados. 

SELECT codedi, nombre
FROM EDITORIAL, (SELECT COUNT(DISTINCT(codtem)) numtemas
                 FROM TEMA)
-- Seleccionamos aquellas editoriales que est�n suscritas a un n�mero
-- de temas igual numtemas
WHERE (codedi,numtemas) IN (SELECT editorial, COUNT(DISTINCT(tema))
                        FROM SUSCRIPCION  
                        GROUP BY editorial);



-- Consulta 8. C�digo de los reportajes (reportaje) vendidos una sola vez, indicando en qu� fecha (fecha) y
-- cu�l es la editorial que lo ha comprado (codedi, nombre). Mostrar ordenado por c�digo de
-- reportaje.
SELECT reportaje, fecha, codedi, nombre
FROM VENTAREPOR, EDITORIAL
WHERE editorial = codedi 
    AND reportaje IN (SELECT reportaje
                      FROM VENTAREPOR
                      GROUP BY reportaje
                      HAVING COUNT(*) = 1)
ORDER BY reportaje;
 

-- Consulta 9. Para cada fot�grafo (codfot) indicar cu�ntas exclusivas (num_exclu) ha entregado y cu�ntos
-- reportajes (num_repor) ha entregado. Tambi�n deben aparecer los fot�grafos sin reportajes, o
-- sin exclusivas, o q ue no tengan ni lo uno ni lo otro.

-- Consulta 10. Temas (codtem) cuyo n�mero de exclusivas (num_exclu) es mayor que su n�mero de reportajes
-- (num_repor) y su n�mero de reportajes es menor que su n�mero de suscripciones (num_suscri).
SELECT Z.tema codtem, num_exclu,num_repor, num_suscri
FROM (SELECT tema, COUNT(*) num_exclu 
      FROM EXCLUSIVA 
      GROUP BY tema
      ORDER BY tema) Z,
     (SELECT tema, COUNT(*) num_repor
      FROM REPORTAJE
      GROUP BY tema) W,
     (SELECT tema, COUNT(*) num_suscri
      FROM SUSCRIPCION
      GROUP BY tema) H
WHERE Z.tema = W.tema 
    AND Z.tema = H.tema
    AND num_exclu > num_repor
    AND num_repor < num_suscri;




