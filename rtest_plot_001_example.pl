use strict;
use warnings;
use Statistics::R;

my $R = Statistics::R->new() ;
  
$R->startR ;
#$R->run(q`png("out.png")`);
$R->run(q`pdf("out.pdf")`);
$R->run(q`plot(c(1, 5, 10), type = "l")`);     
$R->run(q`dev.off()`);

$R->stopR() ;


