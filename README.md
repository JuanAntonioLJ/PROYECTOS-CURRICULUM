# PROYECTOS-CURRICULUM
Para más información pónganse en contacto enviando un correo electrónico a la siguiente dirección: juanantonio.lopezj@outlook.es

En este repostiorio podrán encontrar cuatro carpetas diferentes e independientes entre sí, las cuales contienen parte del código que he escrito para proyectos que he desarrollado en los últimos años.  
     
Carpeta 1. **BASES DE DATOS - SQL**. 

  * Contiene la implementacíon (scripts) de dos dases de datos  en SQL con sus respectivas operaciones de creación de tablas manteniendo los ciclos referenciales de los esquemas lógicos,  inserción, consultas, actualización, modificación y eliminación de datos LDD, LMD).
  
    -Base de datos de una AGENCIA FOTOGRÁFICA.  
    -Base de datos de un GRUPO DE CONCESIONARIOS.

Carpeta 2. **AUTENTICACIÓN (SIGN IN/SIGN UP) - FIREBASE - KOTLIN APP**. 

  * Esta carpeta continene la implementación de las activitys necesarias para loguearse y registrase con email y contraseña en una aplicación Android, conectada a Firebase y Google analytics, y escritas en KOTLIN. Está incluido los ficheros de diseño .xml correspondientes a las activitys. 
  
Carpeta 3. **PROCESADOR DE TEXTO - C++**
  * Implementación del motor interno de un editor de textos avanzado. El programa es capaz de procesar un texto en español (o en cualquier otro idioma, dependiendo   del diccionario usado en ese momento), que se leerá siempre desde la entrada estándar. Se hace especial hincapie, en la optimización del tiempo de ejecución y el  uso de memoria. Tras hacer make en el directorio donde el lector guarde los ficheros que se encuentran en el repositorio, podrán acceder al programa e interactuar con el mismo a través de ciertos comandos epecificados a continuación. Los comandos admisibles son los  siguientes:
  
     1- Cargar un diccionario: el diccionario contiene un conjunto de palabras que se consideran correctas en el lenguaje dado. Cualquier otra palabra no incluida en el diccionario se considerará como un error ortográfico. 

     2- Insertar y eliminar en el diccionario: estos comandos permiten añadir o quitar palabras del diccionario cargado actualmente en el programa.

     3- Procesar texto: dado un texto, buscar todas las palabras con errores ortográficos.
     
     COMANDOS:
     
     \<texto> texto arbitrario \</texto> 
     **DESCRIPCIÓN DE LA ENTRADA:** Dentro de este comando aparecerá un texto arbitrario a ser procesado por el programa. El texto puede incluir palabras, espacios, números, signos de puntuación, etc. Solo se deben analizar las palabras. 
     **FORMATO DE LA SALIDA:** texto anotado
     **DESCRIPCIÓN DEL EFECTO Y SALIDA:** Todo lo que no sean palabras se escribirá igual en la salida. Para cada palabra, si se encuentra en el diccionario, se escribirá la palabra sin más. Si no se encuentra, después de la palabra se escribirá: [error]
     
     \<diccionario> texto arbitrario \</diccionario>**
     **DESCRIPCIÓN DE LA ENTRADA:** Listado de las palabras a incluir en el diccionario de palabras del lenguaje. También pueden aparecer cosas que no sean palabras (como antes), que no deben ser procesadas. Las palabras pueden aparecer repetidas.
     **FORMATO DE LA SALIDA:** [N palabras]
     **DESCRIPCIÓN DEL EFECTO Y SALIDA:** Si existía otro diccionario cargado en ese momento, se elimina y se cargan las nuevas palabras. Al acabar el comando, se escribirá entre corchetes el número de palabras en el diccionario cargado actualmente (N).
     
     \<insertar> palabra1 palabra2... \</insertar>**
     **DESCRIPCIÓN DE LA ENTRADA:** Dentro del comando aparece una lista de palabras a añadir. En este caso no aparecerán números ni signos de puntuación, solo palabras.
     **FORMATO DE LA SALIDA:** [N palabras]
     **DESCRIPCIÓN DEL EFECTO Y SALIDA:** Agrega las palabras dadas al diccionario cargado actualmente. Si ya estaba la palabra, no hace nada. Al acabar, escribirá el número actual de palabras en el diccionario.
     
     \<eliminar> palabra1 palabra2... \</eliminar>**
     **DESCRIPCIÓN DE LA ENTRADA:** Dentro del comando aparece una lista de palabras a eliminar. En este caso no aparecerán números ni signos de puntuación, solo palabras.
     **FORMATO DE LA SALIDA:** [N palabras]
     **DESCRIPCIÓN DEL EFECTO Y SALIDA:** Elimina las palabras dadas al diccionario cargado actualmente. Si ya estaba la palabra, no hace nada. Al acabar, escribirá el número actual de palabras en el diccionario.



Carpeta 4. **APLICACIÓN DE ESCRITORIO - TIENDA**. 

  * Esta carpeta continene la implementación de un programa de escritorio escrito en JAVA destinado para una TIENDA  mediante una arquitectura de 3 capas: (1) _Interfaz gráfica de usuario_ ; (2) _controlador , clases dominio Java + Repositorios_ ; (3) y finalmente un _servicio de persistencia_. La aplicación mantiene conexión con una base de datos h2.
  
