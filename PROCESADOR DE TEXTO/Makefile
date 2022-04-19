a.out : nodotrie.o arboltrie.o tablahash.o funciones.o diccionario.o main.o
	g++ nodotrie.o arboltrie.o tablahash.o funciones.o diccionario.o main.o

funciones.o : funciones.cpp funciones.hpp
	g++ -c funciones.cpp

nodotrie.o : nodotrie.cpp nodotrie.hpp
	g++ -c nodotrie.cpp

arboltrie.o : arboltrie.cpp arboltrie.hpp nodotrie.hpp
	g++ -c arboltrie.cpp

tablahash.o : tablahash.cpp tablahash.hpp funciones.hpp
	g++ -c tablahash.cpp

diccionario.o : diccionario.cpp diccionario.hpp nodotrie.hpp arboltrie.hpp tablahash.hpp funciones.hpp
	g++ -c diccionario.cpp

main.o : main.cpp diccionario.hpp nodotrie.hpp arboltrie.hpp tablahash.hpp funciones.hpp
	g++ -c main.cpp
