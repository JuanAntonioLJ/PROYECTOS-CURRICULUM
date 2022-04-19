#ifndef __NODOTRIE
#define __NODOTRIE

#include <string>

using namespace std;

class ArbolTrie;

class NodoTrie
{
    private:
        friend class ArbolTrie;
        string car;
        NodoTrie* sig, *ptr;
    public:
        NodoTrie();
        ~NodoTrie();
        NodoTrie* consulta(string letra);
        void inserta(string letra);
        void ponMarca();
        void quitaMarca();
        bool hayMarca();
};

#endif