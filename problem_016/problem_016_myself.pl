use warnings;
use strict;
use bignum;
my $num = 2**1000;
my $sum=0;
#print $num,"\n";
while ( $num > 9 ) {
  $num =~ s/^(\d+)(\d)$/$1/;
  #print $num,"\n"; 
  $sum += $2;
}
$sum += $num;
print $sum,"\n";
