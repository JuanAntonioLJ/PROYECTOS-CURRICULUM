#include "funciones.hpp"

string minuscula(string cadena){
	for (unsigned i= 0; i<cadena.length(); i++) 
    {
 		if (cadena[i]>='A' && cadena[i]<='Z')
 			cadena[i]= tolower(cadena[i]);
 			
 		else if (cadena[i]==(char)0xC3 && (cadena[i+1] == (char)0x91 || cadena[i+1] == (char)0x81 
                    || cadena[i+1] == (char)0x89 || cadena[i+1] == (char)0x8d 
                    || cadena[i+1] == (char)0x93 || cadena[i+1] == (char)0x9a 
                    || cadena[i+1] == (char)0x9c))
        {
 			cadena[i+1] += 0x20;
 			i++;
 		}
 	}
 	return cadena;
}
