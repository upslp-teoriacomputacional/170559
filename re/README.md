## Datos personales

 - Universidad Politécnica de San Luis Potosí
 - Espinoza Escamilla David
 - 170559
 - Ingeniería en Tecnologías de la información
 - Teoría Computacional
 - Juan Carlos González Ibarra
 
## Objetivos
Analizador léxico simple

## Problemas al programar  
Se me dificulto a la hora de estar validando los simbolos "+ -*%/" pero la solucion fue poner la expresion asi:
```Perl
$word =~ m/[\+\-\/\*\=\%]/
```
Tambien para poder almacenar los datos con key y su value utilice un hash.Un hash de Perl se define mediante pares key-value. Perl almacena elementos de un hash de una manera tan óptima que puede buscar sus valores basándose en claves muy rápido.Se declaran de la siguiente manera.
```Perl
my %tokens=();
```
Y asi fui llenando el hash con lo valores, primero se hace referencia al hash 
despues entre los corchetes y con comillas ponemos el nombre de nuestra Key, depues poenemos el = y despues va el valor que le queramos dar al hash.
```Perl
    $tokens{'DATATYPE'} = $word;
```

## Código

```Perl
use strict;
use warnings;

my %tokens=();
my @source_code =  split /\s+/, 'int result = 1;'; 

my $word;


foreach $word (@source_code){
    
    # This will check if a token has datatype declaration
    if ($word =~ m/str|int|bool/){        
		$tokens{'DATATYPE'} = $word;
    # This will look for an identifier which would be just a word
    }elsif($word =~ m/[a-zA-Z]/){		       
		$tokens{'IDENTIFIER'} = $word;
    # This will look for an operator
    }elsif($word =~ m/[\+\-\/\*\=\%]/){        
		$tokens{'OPERATOR'} = $word;
    # This will look for integer items and cast them as a number    
    }elsif ($word =~ m/[0-9]/){
		my @wd = $word;		 	
		if($wd[scalar(@wd)-1] =~ m/;/){			
			$tokens{'INTEGER'} = substr $word,0,-1;
			$tokens{'END STATEMENT'} = ';';
		}else{			   
		   $tokens{'INTEGER'} = $word;
		}	
	}
}

# Outputs the token array

my $key;
my $value;

while ( ($key, $value) = each %tokens ) {
 print "$key => $value\n";
}
```