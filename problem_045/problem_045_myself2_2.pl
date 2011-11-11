use strict;
use warnings;

#T_j=P_k=H_i
#<=>j(j+1)/2=k(3k-1)/2=i(2i-1)
#make j as free variable!
#k=(1+sqrt(1+12*j*j+12*k))/6
#i=(1+sqrt(1+4*j*j+4*j))/4
#my $max=10;
my $max=$ARGV[0];
for (my $j=1;$j<=$max;$j++) {
  my $k=(1+sqrt(1+12*$j*$j+12*$j))/6;
  my $i=(1+sqrt(1+4*$j*$j+4*$j))/4;
  if ($k == int($k) and $i == int($i)) {
    print "$j $k $i\n";
    print $j*($j+1)/2," ";
    print $k*(3*$k-1)/2," ";
    print $i*(2*$i-1),"\n";
  }
}
