#!/usr/bin/perl

#/* *****************************************************************************
# *  Name:    Espinoza Escamilla David
# *
# *  Description:
# *
# *  Written:       18/09/2020
# *  Last updated:  20/09/2020
# *
#*
# *
use strict;
use warnings;my @booleanos = qw(0 1);

sub texto {          
    if ($_[0] == 0){       
        return "False";    }else{        
        return "True";
    }      
}#tabla de verdad or

print "x\ty\tx or y\n";
print "-" x 22 . "\n";
my $i;
my $j;
for ($i = 0; $i <= 1; $i++){
    for ($j = 0; $j <= 1; $j++) {        
        printf "%s\t%s\t%s\n",&texto($booleanos[$i]),&texto($booleanos[$j]),&texto($booleanos[$i] or $booleanos[$j]);                
    }     
}
#tabla de verdad and

print "\nx\ty\tx and y\n";
print "-" x 22 . "\n";

for ($i = 0; $i <= 1; $i++){
    for ($j = 0; $j <= 1; $j++) {                 
        printf "%s\t%s\t%s\n",&texto($booleanos[$i]),&texto($booleanos[$j]),&texto($booleanos[$i] and $booleanos[$j]);                
    }     
}#tabla de verdad not 

print "\nx\tnot x\n";
print "-" x 13 . "\n";

for ($i = 0; $i <= 1; $i++){
    printf "%s\t%s\n",&texto($booleanos[$i]),&texto(not($booleanos[$i]));                          
}
#tabla de verdad de ^

print "\nx\ty\tx ^ y\n";
print "-" x 22 . "\n";
for ($i = 0; $i <= 1; $i++){
    for ($j = 0; $j <= 1; $j++) {                 
        printf "%s\t%s\t%s\n",&texto($booleanos[$i]),&texto($booleanos[$j]),&texto($booleanos[$i] xor $booleanos[$j]);                
    }     
}

print "\n\n";
print "-" x 22 . "\n";