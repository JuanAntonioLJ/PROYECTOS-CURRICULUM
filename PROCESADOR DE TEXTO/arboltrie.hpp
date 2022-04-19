#ifndef __ARBOLTRIE
#define __ARBOLTRIE

#include "nodotrie.hpp"
#include "funciones.hpp"
#include <string>

using namespace std;

class ArbolTrie
{
    private:
        NodoTrie* raiz;
        int nElem;
    public:
        ArbolTrie();
        ~ArbolTrie();
        void inserta(string palabra);
        void elimina(string palabra);
        bool consulta(string palabra, int tipo);
        void vacia();
        int nTotal();
};

#endif