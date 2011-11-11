use strict;
use warnings;

#this programm don't get right answer!
#T_j=P_k=H_i
#<=>j(j+1)/2=k(3k-1)/2=i(2i-1)
#j=(1+sqrt(1+12*k*k-4*k))/2
#i=(1+sqrt(1+4*j*j+4*j))/4
#my $max=10;
my $max=$ARGV[0];
for (my $k=1;$k<=$max;$k++) {
  my $j=(1+sqrt(1+12*$k*$k-4*$k))/2;
  my $i=(1+sqrt(1+4*$j*$j+4*$j))/4;
  if ($j == int($j) and $i == int($i)) {
    print "$j $k $i\n";
    print $j*($j+1)/2," ";
    print $k*(3*$k-1)/2," ";
    print $i*(2*$i-1),"\n";
  }
}
