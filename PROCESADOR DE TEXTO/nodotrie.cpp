#include "nodotrie.hpp"
#include <iostream>

NodoTrie::NodoTrie()
{
    car = " ";
    sig = nullptr;
    ptr = nullptr;
}

NodoTrie::~NodoTrie()
{
    delete sig;
    delete ptr;
}

NodoTrie* NodoTrie::consulta(string letra)
{
    NodoTrie* tmp = this;
    while (tmp != nullptr && tmp->car < letra)
    {
        tmp = tmp->sig;
    }
    if (tmp != nullptr && tmp->car == letra)
    {
        return tmp->ptr;
    }
    else
    {
        return nullptr;
    }
}

void NodoTrie::inserta(string letra)
{
    NodoTrie* tmp = this;
    while (tmp->sig != nullptr && tmp->sig->car < letra)
    {
        tmp = tmp->sig;
    }
    if (tmp->sig == nullptr || tmp->sig->car != letra)
    {
        NodoTrie* q = new NodoTrie();
        q->car = letra;
        q->sig = tmp->sig;
        q->ptr = new NodoTrie();
        tmp->sig = q;
    }
}

void NodoTrie::ponMarca()
{
    car = "$";
}

void NodoTrie::quitaMarca()
{
    car = " ";
}

bool NodoTrie::hayMarca()
{
    return car == "$";
}