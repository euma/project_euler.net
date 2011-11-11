use strict;
use warnings;

sub comb_num {
  my $k=shift;
  my $n=shift;

  #When k exceeds n/2
  if ($k>$n/2) {
    $k=$n-$k;
  }
  my $product=1;
  for (my $i=$n-$k+1;$i<=$n;$i++) {
    $product *= $i;
  }
  for (my $i=2;$i<=$k;$i++) {
    $product /= $i;
  }
  return $product;
}

#my $max=$ARGV[0];
my $max=100;
my $start=23;
my $count=0;
for (my $n=$start;$n<=$max;$n++) {
  my $comb=0;
  for (my $k=0;$k<=$n;$k++) {
    $comb=comb_num($k,$n);
    if ($comb > 1000000) { $count++; }
  }
}
print "\n$count\n";
#for (my $n=2;$n<=$max;$n++) {
#  my $comb=0;
#  if ($n % 2 == 0) {
#    $comb=comb_num($n/2,$n);
#  } else {
#    $comb=comb_num(($n-1)/2,$n);
#  }
#  if ($comb > 1000000) { print "$n:$comb\n"; exit 0; }
#}
