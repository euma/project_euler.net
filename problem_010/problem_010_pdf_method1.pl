#!/usr/bin/perl
use strict;
use warnings;
use POSIX;
sub isPrime {
    my $n=shift;
    if ($n == 1) { return 0; }
    elsif ($n < 4) { return 1; } #2 and 3 are prime
    elsif ($n % 2 == 0) { return 0; }
    elsif ($n < 9) { return 1; } # 5 and 7 are prime and we have already excluded 4,6 and 8.
    elsif ($n % 3 == 0) { return 0; }
    else {
        my $r=floor(sqrt($n)); # sqrt(n) rounded to the greatest integer r so that r*r<=n
        #All primes greater than 3 can be written in the form 6k+/-1.
        #so k=1 p=5 or 7;
        #   k=2 p=11 or 13;
        #   k=3 p=17 or 19;
        #   k=4 p=23 or 25;
        my $f=5;
        while ($f<=$r) {
            if ($n % $f == 0) { return 0; }
            if (($n % ($f+2)) == 0) { return 0; }
            $f = $f + 6;
        }
        return 1;
    }
}
my $limit = 2000000;
my $sum = 5; # we know that 2 and 3 are prime
my $n = 5;
#while ($n < $limit) {
while ($n <= $limit) {
  if (isPrime($n)) { $sum += $n; }
  $n += 2; #(6*k-1)+2=(6*k+1)
  #if (($n < $limit) and (isPrime($n))) { $sum += $n; }
  if (($n <= $limit) and (isPrime($n))) { $sum += $n; }
  $n += 4; #(6*k+1)+4=6*(k+1)-1
  #so there use all greater than 3 primes can expressed by 6*k+1 or 6*k-1
}
print $sum,"\n";
