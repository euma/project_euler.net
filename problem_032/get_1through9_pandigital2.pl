use strict;
use warnings;
#real	0m12.718s
#user	0m2.044s
#sys	0m0.576s

use Algorithm::Permute;

my $p = new Algorithm::Permute([1 .. 9]);
while (my @res = $p->next) {
  print join("", @res), "\n";
}
