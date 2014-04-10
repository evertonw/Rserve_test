use strict;
use warnings;
use Statistics::R;

my @lines;
my $line;

my $csv_check = shift @ARGV; #Mark for csv check-----
@ARGV = $csv_check;

while ( defined( $line = <> ) )
{
  push @lines, $line;
}

save_array_output(@lines, ".out");

print "\@lines = \n @lines ";
my $R = Statistics::R->new() ;
  
$R->startR ;
$R->run('library(genetics);');

$R->run('table <- read.table("C:\Users\Everton Elliott\Documents\RPERL\data_freq.txt.out" , header=T, row.names=2);');
$R->run('g1 <- table[, 2];');
$R->run('meang1 <- mean(g1)');
$R->run('print(meang1);');

$R->run('write.table(g1, "C:\Users\Everton Elliott\Documents\RPERL\g1.txt");');
$R->run('write.table(meang1, "C:\Users\Everton Elliott\Documents\RPERL\meang1.txt");');

my $results1 = $R->get('g1');
print "results1 = ", @$results1, "\n";

$R->stopR() ;

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

