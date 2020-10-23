#!/bin/usr/perl

#/* *****************************************************************************
# *  Name:    Espinoza Escamilla David
# *
# *  Description: Automata finito
# *
# *  Written:       13/10/2020
# *  Last updated:  16/10/2020
# *
#*
# **************************************************************************** */
use strict;
use warnings;


my $simbolo = "";

sub caracter {
    $simbolo = "";       
    if ($_[0] eq "a"){
        
        return 0;
    }else{
        if($_[0] eq "b"){            
            return 2;
        }else{
            if ($_[0] eq "\n"){
                return 1;            
            }          
        }
        print "Error el caracter: $_[0] no es  valido\n";
        exit();
        
    }       
    
}

sub encabezado {
    print "|  Edo. Actual |Caracter |  Simbolo  |Edo. Siguiente |\n";
    &body;
}

sub contenido{
    print "|     $_[0]        |    $_[1]\t |   $_[2]     |       $_[3]\t     |\n";
    &body;
}

sub body{
    print "+--------------+---------+-----------+---------------+\n";
}
print "+-------------------------------------+\n";
print "|    Ingrese una cadena a evaluar:    |\n";
print "+-------------------------------------+\n";

#MAIN
#tabla de transiciones del automata AFND
#tabla hecha con la el apoyo de Benjamin Loredo 
my $tabla =  [[0,4,1],[2,3,4],[2,3,4]];

my $estado = 0;
my $aux = 0;
my $estadosig = 0;
my $charcaracter= undef;
my $cadena = <STDIN>;
&body;
&encabezado;


my $character = "";

#ciclo para recorrer la cadena
foreach $character (split //, $cadena) {
    #print "$char\n";
    $aux += 1;
    
  
    #llamamos al metodo para saber si es un caracter valido y el valor retornado se guarda en charcaracter
   $charcaracter = &caracter($character);
    
    #guardamos en estado el valor obtenido en la tabla segun las cordenadas que recibio anteriormente
    $estado=$tabla->[$estado][$charcaracter];
    $estadosig = $estado+1;
    if ($charcaracter == 0){
        $simbolo = " a";
        if ($estado ==1){
            $estadosig = 1;
        }   
    }
    if($charcaracter == 1){
        $simbolo = " b";
    }     
    if($charcaracter == 2){
        $simbolo = "Fin";
    }
    
    if ($estado == 4){
        print "|     $estadosig        |    $character\t | ERROR  |\t     $estado\t     |\n";
        &body;
        print "|              Cadena No Valida :(                   |";
        print "\n+----------------------------------------------------+\n\n";
        exit();
    }
    
    if (($estado == 3) && ($aux==length($cadena))){
        print "|     $estado        |     \t | Fin cadena|\t\t     |\n";
        &body;
        print "|                Cadena Valida :)                    |";
        print "\n+----------------------------------------------------+\n\n";
        exit();
    }
    if ($estado==3){
        $estado=2;
    }
    &contenido($estado,$character,$simbolo,$estadosig);       
}


