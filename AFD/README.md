## Datos personales

 - Universidad Politécnica de San Luis Potosí
 - Espinoza Escamilla DAvid
 - 170559
 - Ingeniería en Tecnologías de la información
 - Teoría Computacional
 - Juan Carlos González Ibarra
 
## Objetivos
1.  Desarrollar un automata finito que valide la entrada de datos en el siguiente formato: n operacion n

## Problemas al programar  
En la parte donde se validaba si era el fin de la cadena me daba un error ya que en lectura de la cadena  perl incluia un salto de linea al final de la cadena y justamente en este bloque no entraba y no servia el programa como debia.
```Perl
 if ($_[0] eq " "){
                return 2;            
            }
```
La solucion fue usar la funcion "chomp()" que tiene perl por default y lo que hace es que a leer a cadena quita ese salto de linea y ahora el programa puede funcionar bien.
```Perl
chomp(my $cadena = <STDIN>);
```