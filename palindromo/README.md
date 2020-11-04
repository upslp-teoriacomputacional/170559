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
La solucion que vi para validar el palindromo fue llenar un arreglo con cada carcter de la  palabra quitando espacios  y convirtiendo todo a minusculas 
y despues con ese arreglo copiarlo a otro arreglo pero de manera inversa, para verificar la palabra simplemente fui recorriendo mi primer arreglo y comparando si las letras eran iguales en la misma posicion en los dos arreglos

## Subrutina para validar el palindromo 

```Perl
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
```