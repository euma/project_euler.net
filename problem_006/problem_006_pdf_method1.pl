use warnings;
use strict;
my $limit = 100;
my $sum_sq = 0;
my $sum = 0;
for (my $i = 1; $i<=$limit; $i++) {
    $sum += $i;
    $sum_sq = $sum_sq + $i**2;
}
print $sum**2 - $sum_sq,"\n";
