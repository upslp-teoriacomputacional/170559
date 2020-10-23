#!/usr/bin/perl


# *  Name:    Espinoza Escamilla David
# *
# *  Description:
# *
# *  Written:       18/09/2020
# *  Last updated:  20/09/2020
# *
#*
# *

use warnings;

sub texto {          
    if ($_[0] == 0){       
        return "False";
        return "True";
    }      
}

print "x\ty\tx or y\n";
print "-" x 22 . "\n";
my $i;
my $j;
for ($i = 0; $i <= 1; $i++){
    for ($j = 0; $j <= 1; $j++) {        
        printf "%s\t%s\t%s\n",&texto($booleanos[$i]),&texto($booleanos[$j]),&texto($booleanos[$i] or $booleanos[$j]);                
    }     
}


print "\nx\ty\tx and y\n";
print "-" x 22 . "\n";

for ($i = 0; $i <= 1; $i++){
    for ($j = 0; $j <= 1; $j++) {                 
        printf "%s\t%s\t%s\n",&texto($booleanos[$i]),&texto($booleanos[$j]),&texto($booleanos[$i] and $booleanos[$j]);                
    }     
}

print "\nx\tnot x\n";
print "-" x 13 . "\n";

for ($i = 0; $i <= 1; $i++){
    printf "%s\t%s\n",&texto($booleanos[$i]),&texto(not($booleanos[$i]));                          
}


print "\nx\ty\tx ^ y\n";
print "-" x 22 . "\n";

    for ($j = 0; $j <= 1; $j++) {                 
        printf "%s\t%s\t%s\n",&texto($booleanos[$i]),&texto($booleanos[$j]),&texto($booleanos[$i] xor $booleanos[$j]);                
    }     
}

print "\n\n";
print "-" x 22 . "\n";