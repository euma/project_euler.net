use strict;
use warnings;
use List::Permutor;

#my $permutor = List::Permutor->new( 0, 1, 2);
my $permutor = List::Permutor->new( 0 .. 9 );
my $index=1;
while ( my @permutation = $permutor->next() ) {
  #print $index,"\n";
  if ($index == 1000000) { print "\n",join("",@permutation),"\n"; last; }
  $index++;
}
