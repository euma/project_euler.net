use strict;
use warnings;
my $max=8;
for (my $i=1;$i<=$max;$i++) {
  for (my $j=$i+1;$j<=$max;$j++) {
    print "$i/$j ";
  }
  print "\n";
}
