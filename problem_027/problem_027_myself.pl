use strict;
use warnings;

sub is_prime {
  my $n=shift;
  if ($n<2) {
    return 0;
  } elsif ($n==2) {
    return 1;
  } elsif ($n%2 == 0) {
    return 0;
  } else {
    my $is_prime=1;
    for(my $factor=3;$factor<=sqrt($n);$factor=$factor+2) {
      if ($n % $factor == 0) {
        return 0;
      }
    }
    return 1;
  }
}
my $coefficient_product=1;
my $limit=1000;
#my $limit=42;
my $max_ab_n=0;
my $a=-$limit+1;
while ($a<$limit) {
  my $b=-$limit+1;
  while ($b<$limit) {
    my $n=0;
    while (1) {
      my $test=$n*$n+$a*$n+$b;
      if (is_prime($test)) {
        $n++;
      } else {
        last;
      }
    }
    #if ($n > 0) { print "$a $b $n\t",$a*$b,"\n"; }
    #if ($n > 1) { print "$a $b $n\t",$a*$b,"\n"; }
    if ($n > $max_ab_n) {
      $max_ab_n=$n;
      $coefficient_product=$a*$b;
      print "$a $b $n\t",$a*$b,"\n";
    }
    $b++;
  }
  $a++;
}
print "\n",$max_ab_n,"\n";
print "\n",$coefficient_product,"\n";
