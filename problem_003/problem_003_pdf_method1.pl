#$n=”the evil big number”;
use strict;
use warnings;
my $n=int($ARGV[0]);
print $n,"\n";
my $factor=2;
my $lastFactor=1;
while ($n>1) {
    if ($n % $factor == 0) {
        $lastFactor=$factor;
        $n=$n / $factor;
    }
    while ($n % $factor == 0) {
        $n=$n / $factor;
    }
    $factor=$factor+1;
}
print $lastFactor,"\n";
