
use strict;
use warnings;
use Statistics::R;

my @numbers = ( 1 .. 10 );

my $R = Statistics::R->new();
$R->set( 'x', \@numbers );
$R->run( q`x = x ^ 2` );
my $squares = $R->get('x');  # a vector is an array of...

print "@$squares";

