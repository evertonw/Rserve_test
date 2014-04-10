use Statistics::RserveClient::Connection;


use strict;
use warnings;


my @lines;
my $line;
my @result ;
my @results1 ;

my $cnx = new Statistics::RserveClient::Connection('localhost');
@result = $cnx->evalString("x='Hello, world!'; x");

my $csv_check = shift @ARGV; #Mark for csv check-----
@ARGV = $csv_check;

while ( defined( $line = <> ) )
{
  push @lines, $line;
}

save_array_output(@lines, ".out");

print "\@lines = \n @lines ";
  
@result = $cnx->evalString(qq!library(genetics);!);

@result = $cnx->evalString(qq!table <- read.table("C:/Users/Everton Elliott/Documents/RPERL/data_freq.txt.out" , header=T, row.names=2);!);
@result = $cnx->evalString(qq!g1 <- table[, 2];!);
@result = $cnx->evalString(qq!meang1 <- mean(g1)!);
@result = $cnx->evalString(qq!print(meang1);!);

@result = $cnx->evalString(qq!write.table(g1, "C:/Users/Everton Elliott/Documents/RPERL/g1.txt")!);
@result = $cnx->evalString(qq!write.table(meang1, "C:/Users/Everton Elliott/Documents/RPERL/meang1.txt")!);

#my $results1 = $R->get('g1');
@results1 = $cnx->evalString("g1");

print "results1 = ", $results1[0], "\n";


#-----------------------------------------------
sub save_array_output
{
  @lines = @_;
  my $mid_name = pop @lines; 
  my $output_name = $csv_check.$mid_name;

  open(MYOUTFILE, ">:utf8", $output_name); # Open output file
  print MYOUTFILE "@lines \n";
  close(MYOUTFILE); # Close output file 
}

