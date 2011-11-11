#!/usr/bin/perl
use strict;
use warnings;

my $limit = 2000000;
my $crosslimit = int(sqrt($limit));
#sieve := new boolean array [2 .. limit] false
my @sieve = (1,1);
for (my $i = 2;$i<=$limit;$i++) {
  push(@sieve,0);
}
# mark even numbers > 2
for (my $n = 4; $n<= $limit; $n += 2) {
  $sieve[$n] = 1;
}
for (my $n = 3; $n<= $crosslimit; $n += 2) {
  # n not marked, hence prime
  if (not $sieve[$n]) {
    for (my $m = $n*$n; $m<=$limit; $m += 2*$n) {
      $sieve[$m] = 1;
    }
  }
}
my $sum = 0;
for (my $n = 2; $n<=$limit; $n++) {
  if (not $sieve[$n]) {
    $sum += $n;
  }
}
print $sum;
