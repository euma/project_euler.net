use strict;
use warnings;
use constant PI    => 4 * atan2(1, 1);

my $n=1000000;
my $fn=3*$n*$n/(PI*PI);
print int($fn);
print "\n";
