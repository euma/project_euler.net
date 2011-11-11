use strict;
use warnings;
#real	0m28.147s
#user	0m5.304s
#sys	0m0.964s

use Algorithm::Loops qw(NextPermuteNum);

#my @list= 0..9;
#my @list= 0 .. 2;
my @list= 1 .. 9;
do { print "@list\n" } while NextPermuteNum @list;
