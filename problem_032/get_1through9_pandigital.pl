use strict;
use warnings;
#real	0m14.472s
#user	0m5.040s
#sys	0m0.708s

use List::Permutor;
my $permutor = List::Permutor->new(1 .. 9);
while ( my @permutation = $permutor->next() ) {
    print join("",@permutation),"\n";
}
