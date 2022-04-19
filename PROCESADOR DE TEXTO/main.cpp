#include <iostream>
#include <sstream>
#include <ctype.h>
#include "diccionario.hpp"

using namespace std;

// ----- Var. globales para tipos de palabras -----

enum tipoPal {MINUS=0, MAYUS=1, FRASE=2, PROPIO=3};
enum tipoToken {PALABRA=0, SIMBOLO=1, COMANDO=2, FINCOMANDO=3, FINAL=4};

const string strTipos[] = {"MINUS", "MAYUS", "FRASE", "PROPIO"};
const string tknTipos[] = {"PALABRA", "SIMBOLO", "COMANDO", "FINCOM", "FINAL"};
const string ESPEC = "ÑñÁáÉéÍíÓóÚúÜü";

// ----- Var. global para 013 -----

int nTotal = 0;

// ----- Funciones de apoyo -----

string obtenerCaracter()
{
    if (cin.eof()) return "";
    else 
    {
        string car;
        car += cin.get();
        if (car[0] == (char)0xc3) car += cin.get();
        return car;
    }
}

void devolverCaracter(string car)
{
    if (car.length() > 1)
    {
        cin.putback(car[1]);
    }
    cin.putback(car[0]);
}

bool esAlfa (string car)
{
    return isalpha(car[0]) || (car[0] == (char)0xC3 && ESPEC.find(car[1]) != string::npos);
}

// ----- Funciones 012 -----

bool siguienteToken(tipoToken &tipo, string &cadena)
{
    if (cin.eof()) return false;

    string caracter;
    caracter = obtenerCaracter();
    if (esAlfa(caracter))
    {
        tipo = PALABRA;
        cadena = caracter;
        while (esAlfa(caracter = obtenerCaracter()) && !cin.eof())
        {
            cadena += caracter;
        }
        if (cadena == "FINAL") tipo = FINAL;
        if (!cin.eof()) devolverCaracter(caracter);
    }
    else if (caracter == "<")
    {
        cadena = "";
        while ((caracter = obtenerCaracter()) != ">" && !cin.eof())
        {
            cadena += caracter;
        }  
        if (cadena.find('/') != string::npos)
        {
            tipo = FINCOMANDO;
        }            
        else 
        {
            tipo = COMANDO;
        }
    }
    else
    {
        tipo = SIMBOLO;
        cadena = caracter;
        while (!(esAlfa(caracter = obtenerCaracter())) && caracter != "<" && !cin.eof())
        {
            cadena += caracter;
        }
        if (!cin.eof()) devolverCaracter(caracter);
    }
    return true;
}

int tipoPalabra (string palabra)
{
    int mayus = 0;
    int minus = 0;
    // Booleano que actúa como indicador de si la primera palabra estaba o no en mayúscula
    bool primerMayus = false;
    // Bucle que recorre una palabra dada y aumenta un contador u otro en función de la letra leída
    for (unsigned int i = 0; i < palabra.length(); i++)
    {
        if (palabra[i] >= 'A' && palabra[i] <= 'Z')
        {
            if (i == 0) primerMayus = true;
            mayus++;
        }
        else if (palabra[i] >= 'a' && palabra[i] <= 'z')
        {
            minus++;
        }
        else if (palabra[i] == (char)0xc3)
        {
            if (palabra[i+1] >= (char)0x81 && palabra[i+1] <= (char)0x9c)
            {
                if (i == 0) primerMayus = true;
                mayus++;
            }
            else
            {
                minus++;
            }
            i++;
        }
    }
    // Si la palabra no tiene mayúsculas y al menos una minúscula --> MINUS
    if (mayus == 0 && minus > 0)
    {
        return 0;
    }
    // Si la palabra no tiene minúsculas y al menos una mayúscula --> MAYUS
    else if (mayus > 0 && minus == 0)
    {
        return 1;
    }
    // Si la palabra solo tiene una mayúscula y estaba al principio --> FRASE
    else if (mayus == 1 && primerMayus == true)
    {
        return 2;
    }
    // Si no es ninguna de las anteriores --> PROPIO
    else return 3;
    
}

void escribirToken (int n, int token, string cadena) {
    cout << n << ". " << tknTipos[token] << ": [" << cadena << "]"; 
    if (token==PALABRA)
        cout << " " << strTipos[tipoPalabra(cadena)];
    cout << endl;
}

// ----- Funciones del intérprete -----

void Meter(string palabra, ConjuntoPalabras &diccionario)
{
    diccionario.inserta(palabra);
}

void Borrar(string palabra, ConjuntoPalabras &diccionario)
{
    diccionario.elimina(palabra);
}

void Comprobar(string palabra, ConjuntoPalabras &diccionario)
{
    cout << palabra;
    if (!diccionario.consulta(palabra, tipoPalabra(palabra)))
        cout << "[error]";
}

void procesarComando(string cadena, ConjuntoPalabras &diccionario);

void procesarTexto(ConjuntoPalabras &diccionario)
{
    tipoToken token;
    string cadena;
    while (siguienteToken(token, cadena) && token != FINCOMANDO)
    {
        if (token == COMANDO) procesarComando(cadena, diccionario);
        else if (token == PALABRA) Comprobar(cadena, diccionario);
        else cout << cadena;
    }
}

void procesarDiccionario(ConjuntoPalabras &diccionario)
{
    tipoToken token;
    string cadena;
    diccionario.vacia();
    while (siguienteToken(token, cadena) && token != FINCOMANDO)
    {
        if (token == PALABRA) Meter(cadena, diccionario);
    }
    cout << "[" << diccionario.nTotal() << " palabras]";
}

void procesarInsertar(ConjuntoPalabras &diccionario)
{
    tipoToken token;
    string cadena;
    while (siguienteToken(token, cadena) && token != FINCOMANDO)
    {
        if (token == PALABRA) Meter(cadena, diccionario);
    }
    cout << "[" << diccionario.nTotal() << " palabras]";
}

void procesarEliminar(ConjuntoPalabras &diccionario)
{
    tipoToken token;
    string cadena;
    while (siguienteToken(token, cadena) && token != FINCOMANDO)
    {
        if (token == PALABRA) Borrar(cadena, diccionario);
    }
    cout << "[" << diccionario.nTotal() << " palabras]";
}

void procesarSugiere(string param)
{}

void procesarRimar(string param)
{}

void procesarMovil(string param)
{}

void procesarAutocorregir(string param)
{}

void procesarCompletar(string param)
{}

void procesarComodines(string param)
{}

void procesarAnagramas(string param, ConjuntoPalabras &diccionario)
{
    //cout << param << "[anag:" << diccionario.anagramas(param) << "]";
}

void procesarResumen(string param)
{}

void procesarComando(string cadena, ConjuntoPalabras &diccionario)
{
    istringstream cadin(cadena);
    string comando, param;
    cadin >> comando;
    if (comando == "texto") procesarTexto(diccionario);
    else if (comando == "diccionario") procesarDiccionario(diccionario);
    else if (comando == "insertar") procesarInsertar(diccionario);
    else if (comando == "eliminar") procesarEliminar(diccionario);
    else
    {
        cadin >> param;
        if (comando == "sugiere") procesarSugiere(param);
        else if (comando == "rimar") procesarRimar(param);
        else if (comando == "movil") procesarMovil(param);
        else if (comando == "autocorregir") procesarAutocorregir(param);
        else if (comando == "completar") procesarCompletar(param);
        else if (comando == "comodines") procesarComodines(param);
        else if (comando == "anagramas") procesarAnagramas(param, diccionario);
        else if (comando == "resumen") procesarResumen(param);
    }
}

// ----- main -----

int main (void)
{
    tipoToken token;
    string cadena;
    ConjuntoPalabras dic;
    while (siguienteToken(token, cadena))
        if (token == COMANDO) procesarComando(cadena, dic);
        else if (token != FINCOMANDO) cout << cadena;
}