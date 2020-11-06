#!/bin/usr/perl

#/* *****************************************************************
# *  Name:    Espinoza Escamilla David
# *	 Matricula : 170559	
# *  Description: palindromos
# *
# *  Written:       03/11/2020
# *  Last updated:  06/11/2020
# *
# ***************************************************************** */

use strict;
use warnings;

print "+-------------------------------------+\n";
print "|    Ingrese una cadena a evaluar:    |\n";
print "+-------------------------------------+\n";
my $cadena = <STDIN>;

#quitar los espacios que hay en la cadena
$cadena =~ s/\s//g;
#coventir a minusculas todas las letras 
$cadena =~ tr/A-Z/a-z/;
#
my @palindromo = split //,$cadena;
my @re = reverse @palindromo;

#subrutina que valida si los caracteres son iguales 
sub igual{
	my ($a,$b)=@_;
	
	if( $a eq $b){
		return 0;
	}else{
		return 1;
	}
}
#tabla realizada con mi compañero Loredo Benjamin
#tabla de estados del automata
my $tabla = [[0,1,0],[1,1,1]];
my $estado = 0;
my $estadosig = 0;

if (scalar @palindromo == 0){
	print "Cadena vacia \n";
}else{
	while(scalar @palindromo != 0){
		$estadosig = $estado;
		#se usa pop para sacar un carater y que nos diga cual fue
		my $car1 = pop(@palindromo);
		my $car2 = pop(@re);
		my $comp = igual($car1,$car2);
		$estado=$tabla->[$estado][$comp];
		
		#Si es palindromo 
        if($estado==1){                 
          print "   No es un palindromo      \n";		  
          exit();
        }       
      }
      # No es palindromo
      if ($estado == 0){
		  print "   Es un palindromo      \n";		
	  }	
}

