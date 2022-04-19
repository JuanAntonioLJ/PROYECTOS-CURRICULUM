#include "arboltrie.hpp"

ArbolTrie::ArbolTrie()
{
    raiz = new NodoTrie();
    nElem = 0;
}

ArbolTrie::~ArbolTrie()
{
    delete raiz;    
}

void ArbolTrie::inserta(string palabra)
{
    NodoTrie* pos = raiz;
    string aux = "";
    int i = 0;
    while (palabra[i] != '\0')
    {
        aux += palabra[i];
        if (pos->consulta(aux) == nullptr)
        {
            pos->inserta(aux);
        }
        pos = pos->consulta(aux);
        aux = "";
        i++;
    }
    if (!pos->hayMarca())
    {
        pos->ponMarca();
        nElem++;
    }
}

void ArbolTrie::elimina(string palabra)    
{
    NodoTrie* pos = raiz;
    string aux = "";
    for (int i = 0; palabra[i] != '\0'; i++)
    {
        aux += palabra[i];
        if (pos->consulta(aux) != nullptr)
        {
            pos = pos->consulta(aux);
        }
        aux = "";
    }
    if (pos->hayMarca())
    {
        pos->quitaMarca();
        nElem--;
    }
}

bool ArbolTrie::consulta(string palabra, int tipo)
{
    NodoTrie* pos = raiz;
    string aux = "";
    if (tipo == 1 || tipo == 2)
    {
        string palabra_minus = minuscula(palabra);
        string aux_minus = "";
        
        for (int i = 0; palabra[i] != '\0' && pos != nullptr; i++)
        {
            aux += palabra[i];
            pos = pos->consulta(aux);
            aux = "";
        }
        if (pos != nullptr && pos->hayMarca()) 
        {
            return true;
        }
        else
        {
            pos = raiz;
            for (int i = 0; palabra_minus[i] != '\0'; i++)
            {
                aux_minus += palabra_minus[i];
                if (pos->consulta(aux_minus) == nullptr)
                    return false;
                pos = pos->consulta(aux_minus);
                aux_minus = "";
            }
            if (pos->hayMarca())
                return true;  
        }
    }
    else
    {
       for (int i = 0; palabra[i] != '\0'; i++)
        {
            aux += palabra[i];
            if (pos->consulta(aux) == nullptr)
            {
                return false;
            } 
            pos = pos->consulta(aux);
            aux = "";
        }
        if (pos->hayMarca()) 
        {
            return true;
        } 
    }
    return false;
}

void ArbolTrie::vacia()
{
    delete raiz;
    nElem = 0;
    raiz = new NodoTrie();
}

int ArbolTrie::nTotal()
{
    return nElem;
}