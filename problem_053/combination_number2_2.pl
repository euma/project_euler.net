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

my $max=$ARGV[0];
for (my $n=2;$n<=$max;$n++) {
  for(my $k=0;$k<=($max-$n);$k++) {
    print " ";
  }
  for (my $k=0;$k<=$n;$k++) {
    print comb_num($k,$n)," ";
  }
  print "\n";
}
