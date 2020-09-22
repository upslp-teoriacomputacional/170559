# Como solucionaste el problema



Lo hice utilizando los modulos de CPAN ya que el modulo lo
hacia mas facil


### Instalacion de los modulos CPAN

Para poder hacer este programa tuve que instalar algunos modulos de CPAN(Comprehensive Perl Archive Network) en mi pc, pero primero empezando con el instalador de estos modulos que hara mas fácil la tarea de instalar modulos, solo introduje este comando en el CMD 
```
cpan App::cpanminus
``` 
y despues este comando 
```
cpanm Set::Scalar
``` 


Las funciones que nos da el modulo y que sirven para trabajar con los conjuntos son las siguiente:

```
$s = Set::Scalar->new; #Donde nos crea un nuevo 
```
```
conjunto $s->insert('a', 'b');#sirve para insertar elementos en los conjutos
```
```
$s->delete('b'); #Sirve para eliminar un elemento especifico del conjunto
```
```
   $t = $s->copy; #Sirve para copiar los elementos de un conjunto a otro
```
# Operaciones de los conjuntos 
```

$u = $s->union($t); 
$i = $s->intersection($t); 
$d = $s->difference($t); 
$e = $s->symmetric_difference($t);

$is = $s->is_subset($t); 
$iS = $s->is_superset($t);
```
# Problemas a la hora de programar
Cabe destacar que en los dos comandos de arriba en el lenguage Perl nos regresa valores como 0 o 1 falso o verdadero respectivamente y aqui para poder tener una salida del programa que no fuera 0 o 1 simplemente agregue una condicion para que evaluara el caso y desplegara en pantalla si era falso o verdadero.

```perl
#Subconjuntos 
sub subconjunto{
    print "\n\nSubconjuntos\n";
    my $i = $ConjuntoA->is_subset($ConjuntoB);
    my $s = $ConjuntoB->is_subset($ConjuntoA);        
    if ($i) { 
        print "A es subconjunto de B\n"; 
     }else{ 
         print "A no es subconjunto de B\n"; 
     }  
     if ($s) { 
        print "B es subconjunto de A\n"; 
     }else{ 
         print "B no es subconjunto de A\n"; 
     }  
}

#Superconjuntos
sub super_conj{
    print "\nSuperconjuntos\n";
    my $q = $ConjuntoB -> is_superset($ConjuntoA);
    my $w = $ConjuntoA -> is_superset($ConjuntoB);
    if ($w) { 
        print "A es superconjunto de B\n"; 
     }else{ 
         print "A no es superconjunto de B\n"; 
     }  
     if ($q) { 
        print "B es superconjunto de A\n"; 
     }else{ 
         print "B no es superconjunto de A\n"; 
     }  
}
```
