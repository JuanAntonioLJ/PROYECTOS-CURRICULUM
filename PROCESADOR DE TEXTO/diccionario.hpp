#ifndef __DICCIONARIO
#define __DICCIONARIO

#include "tablahash.hpp"
#include "arboltrie.hpp"

using namespace std;

class ConjuntoPalabras
{
    private:
        TablaHash th;
        ArbolTrie ab;
    public:
        ConjuntoPalabras();
        void inserta(string palabra);
        void elimina(string palabra);
        bool consulta(string palabra, int tipo);
        void vacia();
        int nTotal();
        string anagramas(string palabra);
};

#endif