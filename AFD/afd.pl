#!/bin/usr/perl

#/* *****************************************************************************
# *  Name:    Espinoza Escamilla David
# *
# *  Description: Automata finito
# *
# *  Written:       01/05/2020
# *  Last updated:  5/10/2020
# *
#*
# **************************************************************************** */
use strict;
use warnings;


my $simbolo = "";

#Definimos la subrutina caracter
sub caracter {
    $simbolo = "";    
        
    #comparamos si es digito o operador
    if ($_[0] =~  m/[0-9]/ ){
        $simbolo = " Digito ";
        return 0;
    }else{
        if($_[0] =~  m/[\+\-\/\*]/){
            $simbolo = "Operador";
            return 1;
        }else{
            if ($_[0] eq " "){
                return 2;            
            }          
        }
        #si no es ni un digito ni un operador entonces es un caracter no validp
        print "Error el caracter: $_[0] no es  valido\n";
        exit();
        
    }       
    
}

#definimos al la subrutina  encabezado
sub encabezado {
    print "|  Edo. Actual |Caracter |  Simbolo  |Edo. Siguiente |\n";
    &body;
}

#definimos la subrutina contenido donde guarda cada valor despues de encontrarlo en un ciclo
sub contenido{
    print "|     $_[0]        |    $_[1]\t | $_[2]  |       $_[3]\t     |\n";
    &body;
}

sub body{
    print "+--------------+---------+-----------+---------------+\n";
}
print "+-------------------------------------+\n";
print "|    Ingrese una cadena a evaluar:    |\n";
print "+-------------------------------------+\n";

#MAIN
#tabla de transiciones del automata AFD
my $tabla = [[1,"E","E"],["E",2,"E"],[3,"E","E"],["E","E","A"]];

my $estado = 0;

chomp(my $cadena = <STDIN>);
&body;
&encabezado;

#ciclo para recorrer la cadena
my $character = "";
foreach $character (split //, $cadena) {
    
    my $estadosig = $estado;
  
    #llamamos al metodo para saber si es un caracter valido y el valor retornado se guarda en charcaracter
    my $charcaracter = &caracter($character);
    
    #guardamos en estado el valor obtenido en la tabla segun las cordenadas que recibio anteriormente
    $estado=$tabla->[$estado][$charcaracter];
    
    #Si el valor obtenido es una E imprimimos cadena no valida
    if ($estado eq "E"){
        print "|     $estadosig        |    $character\t | $simbolo  |\t     $estado\t     |\n";
        &body;
        print "|              Cadena No Valida :(                   |";
        print "\n+----------------------------------------------------+\n\n";
        exit();
    }
    &contenido($estadosig,$character,$simbolo,$estado);       
}


#al concluir si el estado no es 3 que es el de aceptacion imprimimos cadena no valida    
print "|              Cadena No Valida :((                  |\n+----------------------------------------------------+\n"unless $estado == 3;;

    

#si el estado es 3 es una cadena de aceptacion
if ($estado == 3){
    print "|     $estado\t       |\t |Fin Cadena |\t\t     |\n";
    &body;
     print "|                Cadena Valida ;)                    |\n";
    print "+----------------------------------------------------+\n";
}    
print "\n\n"