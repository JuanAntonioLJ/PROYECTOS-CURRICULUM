#ifndef __TABLAHASH
#define __TABLAHASH

#include <list>
#include <cmath>
#include <string>
#include <iostream>
#include <algorithm>
#include "funciones.hpp"

using namespace std;

class TablaHash
{
    private:
        list<string>* T;
        int B;
        int nElem;
    public:
        TablaHash();
        ~TablaHash();
        int h(string palabra);
        void reestruct();
        bool consulta(string palabra, int tipo);
        void inserta(string palabra);
        void elimina(string palabra);
        void vacia();
        int nTotal();
        string anagramas(string palabra);
};

#endif