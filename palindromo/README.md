## Datos personales

 - Universidad Politécnica de San Luis Potosí
 - Espinoza Escamilla David
 - 170559
 - Ingeniería en Tecnologías de la información
 - Teoría Computacional
 - Juan Carlos González Ibarra
 
## Objetivos
Verificar si una palabra es palindromo

## Solucion

Primero se llena la pila con las letras de la cadena y se  copia la pila pero en orden inverso, despues se usa la funcion pop() para ir quitando elementos en las dos pilas y comparamos para ver si son iguales y asi va con toda la cadena.
## Subrutina para valida los caracteres

```Perl
sub igual{
	my ($a,$b)=@_;
	
	if( $a eq $b){
		return 0;
	}else{
		return 1;
	}
}
```
## Código
```Perl
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
```