use strict;
use warnings;
use bignum;

#3001

#9110846700

#real  0m16.231s
#user  0m15.633s
#sys 0m0.024s

my $sum=0;
my $max=1000;
#my $max=20;
for (my $i=1;$i<=$max;$i++) {
  my $ii=$i**$i;
  my $tenten=10**10;
  my $mod_i=$ii % $tenten;
  #print "$ii = $mod_i mod $tenten\n";
  $sum += $mod_i;
}
print "\n$sum\n";
print length($sum),"\n";
$sum =~ /^(\d+)(\d{10})/;
print "\n$2\n";
