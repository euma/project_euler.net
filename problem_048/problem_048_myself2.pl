use strict;
use warnings;
use bignum;

#time perl problem_048_myself2_2.pl

#4629110846700
#13

#9110846700

#real  0m17.954s
#user  0m17.233s
#sys 0m0.024s

my $sum=0;
my $max=1000;
#my $max=100;
for (my $i=1;$i<=$max;$i++) {
  $sum += $i**$i;
}
print "\n$sum\n";
print length($sum),"\n";
$sum =~ /^(\d+)(\d{10})/;
print "\n$2\n";
