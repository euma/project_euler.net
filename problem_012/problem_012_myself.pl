#!/usr/bin/perl
use strict;
use warnings;
my $n=$ARGV[0];
my $max=$n*($n+1)/2;
my $divisors = 0;
for (my $i=1;$i<=$max;$i++) {
  if ($max % $i == 0) {
    $divisors++;
  }
  if ($divisors >= 500) { last; }
}
print $divisors,"\n";
