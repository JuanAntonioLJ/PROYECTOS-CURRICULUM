#include "diccionario.hpp"

ConjuntoPalabras::ConjuntoPalabras()
{}

void ConjuntoPalabras::inserta(string palabra)
{
    //th.inserta(palabra);
    ab.inserta(palabra);
}

void ConjuntoPalabras::elimina(string palabra)
{
    //th.elimina(palabra);
    ab.elimina(palabra);
}

bool ConjuntoPalabras::consulta(string palabra, int tipo)
{
   // return th.consulta(palabra, tipo);
    return ab.consulta(palabra, tipo);
}

void ConjuntoPalabras::vacia()
{
    //th.vacia();
    ab.vacia();
}

int ConjuntoPalabras::nTotal()
{
   //return th.nTotal();
   return ab.nTotal();
}

string ConjuntoPalabras::anagramas(string palabra)
{
    //return th.anagramas(palabra);
}