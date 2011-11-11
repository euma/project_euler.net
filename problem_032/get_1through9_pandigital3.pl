use strict;
use warnings;
#real	0m11.265s
#user	0m0.536s
#sys	0m0.596s

use Algorithm::Permute;
my @array = (1 .. 9);
Algorithm::Permute::permute { print join("",@array),"\n" } @array;
