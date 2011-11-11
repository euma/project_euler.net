use strict;
use warnings;;
my $limit = 100;
my $sum = $limit*($limit + 1)/2;
my $sum_sq = (2*$limit + 1)*($limit + 1)*$limit/6;
print $sum**2 - $sum_sq,"\n";
