use strict;
use warnings;

#better than use List::Permutor;
use Algorithm::Loops qw(NextPermuteNum);

my @list= 0..9;
#my @list= 0 .. 2;
my $index=1;
my $stop=0;
do {
  if ($index == 1000000) {
    print "\n",join("",@list),"\n";
    $stop=1;
  }
  $index++;
} while (NextPermuteNum @list and not $stop);
