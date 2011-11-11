#!/usr/bin/perl
use strict;
use warnings;
use bignum;
sub count_divisor {
  my $n=shift;
  my $triangle_number=$n*($n+1)/2;
  my $divisors = 0;
  my $first=1;
  my $step=1;
  my $i=2;
  my $max=sqrt($triangle_number);
  while ($i<=$max) {
    if ($triangle_number % $i == 0) {
      if ($first) {
        $step = $i;
        $first = 0;
      }
      $divisors++;
    }
    $i += $step;
  }
  if ($max == int($max)) { return 2*$divisors; }
  else { return 2*$divisors+1; }
}
for (my $n=2**500;;$n++) {
  my $count_number = count_divisor($n);
  my $triangle_number=$n*($n+1)/2;
  if ($count_number > 500) {
    print "> 500:  $triangle_number\n";
    last;
  } else {
    if ($count_number == 500) {
      print "= 500:  $triangle_number\n";
      last;
    } else {
      print "< 500:  $triangle_number\n";
    }
  }
}
