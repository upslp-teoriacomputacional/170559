#!/bin/usr/perl

#/* *****************************************************************
# *  Name:    Espinoza Escamilla David
# *	 Matricula : 170559	
# *  Description: expresion regular
# *
# *  Written:       03/11/2020
# *  Last updated:  04/11/2020
# *
#*
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

#subrutina que valida si la palabra es palindromo


sub pald{	
	#se igual otro array con ordeen inverso a otro array
	my @re = reverse(@palindromo); 
	
	my $cont = 0;	
	#se recorre cada elemento
	for(@palindromo){
		#si en alguna parte no coincide entonces no es palidromo 
		#y se retorna 0
		if ($palindromo[$cont] ne $re[$cont]){
				return 0;
		}
		$cont+=1;
	}
	#si la palabra es palindromo retornamos 1
	return 1;
}
	
if (&pald == 1){
	print "La palabra $cadena es un palindromo";
}else{
	print "La palabra $cadena  no es un palindromo";
}

