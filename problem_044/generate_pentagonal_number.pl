use strict;
use warnings;
my $n=$ARGV[0];
for (my $i=1;$i<=$n;$i++) {
  print "$i: ",$i*(3*$i-1)/2,"\n";
}
