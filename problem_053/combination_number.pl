use strict;
use warnings;

#C(r,n) = n!/(r!(n−r)!)
sub factorial {
  my $n=shift;
  if ($n < 0) {
    return 0;
  } else {
    my $product=1;
    for (my $i=2;$i<=$n;$i++) {
      $product *= $i;
    }
    return $product;
  }
}

sub comb_num {
  my $r=shift;
  my $n=shift;
  if ($r <= $n) {
    if ($r == 0 or $r == $n) {
      return 1;
    } else {
      return factorial($n)/(factorial($r)*factorial($n-$r));
    }
  } else {
    return 0;
  }
}

my $max=$ARGV[0];
for (my $n=2;$n<=$max;$n++) {
  for (my $k=0;$k<=$n;$k++) {
    print comb_num($k,$n)," : ";
  }
  print "\n";
}
