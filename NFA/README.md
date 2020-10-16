## Datos personales

 - Universidad Politécnica de San Luis Potosí
 - Espinoza Escamilla DAvid
 - 170559
 - Ingeniería en Tecnologías de la información
 - Teoría Computacional
 - Juan Carlos González Ibarra
 
## Objetivos
1.  Desarrollar un NFA que valide la entrada de datos en el siguiente formato: a*ba*

## Problemas al programar  
En la parte donde se validaba si era el fin de la cadena me daba un error ya que en lectura de la cadena  perl lo hacia con la funcion chomp() pero me quitaba el salto de linea eontnces la solucion fue quitar el chomp() y poner lo siguiente para validar el final de la cadena
```Perl
 if ($_[0] eq "\n"){
                return 2;            
            }
```

Tambien utiliza la funcion lenght($cadena) para obtener el largo de la cadena y no usar variables extras

```Perl
 if (($estado == 3) && ($aux==length($cadena)))
```

## Bloque principal

```Perl
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
```