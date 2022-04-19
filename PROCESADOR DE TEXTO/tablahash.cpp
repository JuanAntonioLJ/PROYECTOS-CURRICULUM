#include "tablahash.hpp"

TablaHash::TablaHash()
{
    B = 500;
    T = new list<string>[B];
    nElem = 0;
}

TablaHash::~TablaHash()
{
    delete[] T;
}

int TablaHash::h(string palabra)
{
    int E = 13;
    int suma = 0;
    for (int i = 0; i < palabra.length(); i++)
    {
        E = pow(E, i);
        suma += E * (int)palabra[i];
    }
    return abs(suma % B);
}

void TablaHash::reestruct()
{
    int cubetas = B;
    B = B*3;
    list<string>* aux = new list<string>[B];
    for (int i = 0; i < cubetas; i++)
    {
        list<string>::iterator it = T[i].begin();
        list<string>::iterator auxit;
        while (it != T[i].end())
        {
            int pos = h(*it);
            auxit = aux[pos].begin();
            while (auxit != aux[pos].end() && *auxit < *it)
                auxit++; 
            if (auxit == aux[pos].end() || *auxit != *it)
            {
                 aux[pos].insert(auxit, *it);
            }
            it++;
        }
    }
    delete[] T;
    T = aux;
}

bool TablaHash::consulta(string palabra, int tipo)
{
    int pos = h(palabra);
    list<string>::iterator it = T[pos].begin();
    if (tipo == 1 || tipo == 2)
    {
        string palabra_minus = minuscula(palabra);
        int pos2 = h(palabra_minus);
        while(it != T[pos].end() && *it < palabra)
        {
            it++;
        }
        if (it != T[pos].end() && *it == palabra)
        {
            return true;
        }
        else
        {
            it = T[pos2].begin();
            while (it != T[pos2].end() && *it < palabra_minus)
            {
                it++;
            }
            if (it != T[pos2].end() && *it == palabra_minus)
            {
                return true;
            }
        }
    }
    else
    {
        while (it != T[pos].end() && *it < palabra)
        {
            it++;
        }
        if (it != T[pos].end() && *it == palabra)
        {
            return true;
        }
    }
    return false;
}

void TablaHash::inserta(string palabra)
{
    int pos = h(palabra);
    list<string>::iterator it = T[pos].begin(); 
    while (it != T[pos].end() && *it < palabra)
        it++; 
    if (it == T[pos].end() || *it != palabra)
    {
        T[pos].insert(it, palabra);
        nElem++;
    }
    if (nElem >= 2*B)
        this->reestruct();
}

void TablaHash::elimina(string palabra)
{
    int pos = h(palabra);
    list<string>::iterator it = T[pos].begin(); 
    while (it != T[pos].end() && *it < palabra)            
        it++; 
    if (*it == palabra)
    {
        T[pos].erase(it);
        nElem--;
    }
}

void TablaHash::vacia()
{
    for (int i = 0; i < B; i++)
        T[i].clear();
    nElem = 0;
}

int TablaHash::nTotal()
{
    return nElem;
}

string TablaHash::anagramas(string palabra)
{
    string anagramas;
    int pos = h(palabra);
    sort(palabra.begin(),palabra.end());
    if (T[pos].empty())
        return " ";
    list<string>::iterator it = T[pos].begin();
    while (it != T[pos].end())
    {
        string actual = *it;
        sort(actual.begin(),actual.end());
        if (palabra == actual)
        {
            anagramas += " ";
            anagramas += *it;
        }
        it++;
    }
    if (anagramas.empty())
        return anagramas += " ";
    return anagramas;    
}