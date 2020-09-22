# Compuertas - demostración


En este programa realizamos las tablas de verdad de dos variables de tipo booleano, usamos las siguientes compuertas
- OR
- AND
- NOT
- XOR



# Como trabajar con las compuertas en Perl
#### OR
Con la compuerta OR. Si alguno de los elementos es diferente de 0 entonces esto sera VERDADERO o como lo interpreta Perl es igual a 1.
```Perl
($booleanos[0] or $booleanos[1])
``` 
#### AND
Con la compuerta AND. Si alguno de los elementos es diferente de 0 entonces esto sera FALSO o como lo interpreta Perl es igual a 0.Para ser VERDADERO los 2 elementos tienen que ser VERDADEROS o con valor 1.
```Perl
($booleanos[0] and $booleanos[1])
``` 

#### NOT
Con la compuerta NOT. Esto lo que hace es invertir el estado logico del elemento.
```Perl
not($booleanos[$i])
``` 
#### XOR
Con la compuerta XOR. Lo que hace es  solamente es que cuando ambos elementos tienen valores diferentes es VERDADERO y es FALSO si las dos elementos son ambos verdaderas o ambos falsas.
```Perl
($booleanos[0] xor $booleanos[1])
``` 

# Problemas al programar
Como ya hemos mencionado antes Perl toma los valores True o False como 1 o 0 respectivamente, entonces para que no solo mostrara valores de 1 o 0 fue hacer una función que regresaba la cadena True o False dependiendo de su valor.

```Perl
sub texto { 
    #$_[0] toma el valor que se la ha pasado
    if ($_[0] == 0){       
        return "False";
    }else{        
        return "True";
    }      
}
```