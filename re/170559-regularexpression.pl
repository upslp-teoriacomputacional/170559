#!/bin/usr/perl


#/* *****************************************************************
# *  Name:    Espinoza Escamilla David
# * matricula: 170559
# *  Description: expresion regular
# *
# *  Written:       22/10/2020
# *  Last updated:  22/10/2020
# *
#*
# ***************************************************************** */


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



sub variablePROLOG{
	#'''(str)-->bool. True si "w" es un nombre de variable correcto'''
	 my @w = split //,$_[0];	
	if(($w[0]=~ m/[A-Z]/) or ($w[0]=~ m/_/)){
		#El primer caracter es una mayuscula o un subrayado		
		splice(@w,0,1);		
		while((scalar @w != 0)and($w[0] =~ m/[a-zA-Z0-9]/ or $w[0] =~ m/_/)){
			#Mientras queden caracteres en "w" y el primer caracter actual sea un alfanumerico o un subrayado, todo esta bien			
			splice(@w,0,1); #Quitar el primer caracter
		}
		if (scalar @w == 0){
				#Si ya no quedan elementos a revisar, es una variable PROLOG
				return 1;
		}
	}
	return 0;
}
