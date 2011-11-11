use warnings;
use strict;
use bignum;
my $num = 12345;
my $sum=0;
#print $num,"\n";
while ( $num > 9 ) {
  $num =~ s/^(\d+)(\d)$/$1/;
  #print $num,"\n"; 
  print "$2 -- ";
  $sum += $2;
}
print "$num -- ";
$sum += $num;
print "\n",$sum,"\n";
