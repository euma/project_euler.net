use strict;
use warnings;

sub is_pentagonal {
  my $n=shift;
  #my $tmp=sqrt(24*$n+1)+1;
  #my $test=$tmp/6;
  my $test=(sqrt(24*$n+1)+1)/6;
  if ($test == int($test)) {
    return 1;
  } else {
    return 0;
  }
}
#for (my $i=1;$i<=10;$i++) {
#    my $num=$i*(3*$i-1)/2;
#    if (is_pentagonal($num)) {
#      print "$num is pentagonal number\n";
#    } else {
#      print "$num (not pentagonal number)\n";
#    }
#}
#for (my $i=1;$i<=150;$i++) {
#    if (is_pentagonal($i)) {
#      print "$i is pentagonal number\n";
#    } else {
#      print "$i (not pentagonal number)\n";
#    }
#}
my $max_sum_kj=$ARGV[0];
jump:
#there my find order is
#$sum_kj=3
#$j=1,$k=2;

#$sum_kj=4
#$j=1,$k=3;

#$sum_kj=5
#$j=1,$k=4;
#$j=2,$k=3;

#$sum_kj=6
#$j=1,$k=5;
#$j=2,$k=4;

#$sum_kj=7
#$j=1,$k=6;
#$j=2,$k=5;
#$j=3,$k=4;

#but this order is not right!
for (my $sum_kj=3;$sum_kj<=$max_sum_kj;$sum_kj++) {
  for (my $j=1;$j<=($sum_kj-1)/2;$j++) {
    my $k=$sum_kj-$j;
    my $testk=$k*(3*$k-1)/2;
    my $testj=$j*(3*$j-1)/2;
    my $k_minus_j=$testk-$testj;
    my $k_plus_j=$testk+$testj;
    if (is_pentagonal($k_minus_j) and is_pentagonal($k_plus_j)) {
      print "$testk $testj -- ";
      print $k_minus_j,"\n";
      last jump;
    }
  }
}
