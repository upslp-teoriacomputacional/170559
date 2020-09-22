#!/usr/bin/perl

#/* *****************************************************************************
# *  Name:    Espinoza Escamilla David
# *
# *  Description: Operaciones con conjuntos
# *
# *  Written:       13/09/2020
# *  Last updated:  15/09/2020
# *
#*
# **************************************************************************** */

use strict;
use warnings;
use Set::Scalar;

#Conjutos(definicion)
my $ConjuntoA = Set::Scalar->new(1..5);
my $ConjuntoB = Set::Scalar->new(3..7);
my $ConjuntoC = Set::Scalar->new;

print "Conjunto A : $ConjuntoA\n";
print "Conjunto B : $ConjuntoB\n";
print "Conjunto C : $ConjuntoC\n";

#Eliminar un dato del conjunto
sub elimina{
    print "\nEliminar un dato del conjunto";
    $ConjuntoA -> delete(2);
    print "\nConjunto A despues de eliminar un elemento: ",$ConjuntoA,"\n";
 
}

#Copiar conjunto
sub copiarConjunto{
    print "\nCopiar conjunto";    
    $ConjuntoB = $ConjuntoA->copy;
    print "\nConjunto A = ", $ConjuntoA," Conjunto B = ",$ConjuntoB;
}

 #Limpiar todo el conjunto
 sub limpiarConjunto{ 
     my $nuevo_conjuntoA = $ConjuntoA->copy;
    print "\nEliminar los elementos de todo el conjunto A";
    $nuevo_conjuntoA -> clear;
    print "\nEl conjunto limpio:", $nuevo_conjuntoA,"\n";
 }
 
#Agregar nuevo elemento al conjunto
sub agregarElemento{
    print "\nAgregar nuevo elemento al conjunto";
    $ConjuntoB -> insert(987);
    print "\nEl nuevo conjunto B es: ",$ConjuntoB,"\n";    
}

#Operacion union de conjuntos
sub union{
    print "\n\nOperacion union de conjuntos";
    print "\nLa union de los conjuntos A y B : ";    
    print "\n",$ConjuntoA->union($ConjuntoB);  
}


#Operacion interseccion de conjuntos
sub interseccion{
    print "\n\nOperacion interseccion de conjuntos";
    print "\nLa interseccion de los conjuntos A y B"; 
    print "\n",$ConjuntoA -> intersection($ConjuntoB);   
}

#Operacion diferencia de conjuntos
sub diferencia{
    print "\n\nOperacion diferencia de conjuntos";
    print "\nLa diferencia de los conjuntos A - B:";  
    print "\n",$ConjuntoA - $ConjuntoB;    
}

#Operacion diferencia simetrica de conjuntos
sub dif_simetrica{
    print "\n\nOperacion diferencia simetrica de conjuntos";
    print "\nLa diferencia simetrica de los conjuntos A B";   
    print "\n",$ConjuntoA % $ConjuntoB;    
     print "\nLa diferencia simetrica de los conjuntos B A";  
    print "\n",$ConjuntoB % $ConjuntoA;
     print "\nLa diferencia simetrica de los conjuntos A C";     
    print "\n",$ConjuntoA % $ConjuntoC;
     print "\nLa diferencia simetrica de los conjuntos B C";      
    print "\n",$ConjuntoB % $ConjuntoC;     
}

#Subconjuntos 
sub subconjunto{
    print "\n\nSubconjuntos\n";
    my $i = $ConjuntoA->is_subset($ConjuntoB);
    my $s = $ConjuntoB->is_subset($ConjuntoA);        
    if ($i) { 
        print "A es subconjunto de B\n"; 
     }else{ 
         print "A no es subconjunto de B\n"; 
     }  
     if ($s) { 
        print "B es subconjunto de A\n"; 
     }else{ 
         print "B no es subconjunto de A\n"; 
     }  
}

#Superconjuntos
sub super_conj{
    print "\nSuperconjuntos\n";
    my $q = $ConjuntoB -> is_superset($ConjuntoA);
    my $w = $ConjuntoA -> is_superset($ConjuntoB);
    if ($w) { 
        print "A es superconjunto de B\n"; 
     }else{ 
         print "A no es superconjunto de B\n"; 
     }  
     if ($q) { 
        print "B es superconjunto de A\n"; 
     }else{ 
         print "B no es superconjunto de A\n"; 
     }  
}

#llamada de funciones
&elimina;
&copiarConjunto;
&limpiarConjunto;
&agregarElemento;
&union;
&interseccion;
&diferencia;
&dif_simetrica;
&subconjunto;
&super_conj;
