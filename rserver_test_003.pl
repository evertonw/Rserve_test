use Statistics::RserveClient::Connection;


use strict;
use warnings;


my @lines;
my $line;
my @result ;
my @results1 ;

my $cnx = new Statistics::RserveClient::Connection('localhost');
@result = $cnx->evalString("x='Hello, world!'; x");

  
@result = $cnx->evalString(qq!table <- read.table("C:/Users/Everton Elliott/Documents/RPERL/data_freq.txt.out" , header=T, row.names=2);!);

