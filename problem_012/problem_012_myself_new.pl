#!/usr/bin/perl
use strict;
use warnings;
use POSIX;
sub total_divisors {
  my $n=shift;
  if ($n == 1) { return 1; }
  else {
    my $divisors=0;
    my $test_max=sqrt($n);
    for (my $i=2;$i<$test_max;$i++) {
      if ($n % $i == 0) {
        $divisors++;
      }
    }
    if ($test_max == ceil($test_max)) { $divisors *= 2; $divisors += 3;}
    else { $divisors *= 2; $divisors += 2;}
    return $divisors;
  }
}
my $max=$ARGV[0];
for (my $m=1;$m<=$max;$m++) {
  my $n=$m*($m+1)/2;
  my $total = total_divisors($n);
  print "\n$total\n";
  if ($total >= 500) { print "find! It's $n\n";last; }
}
