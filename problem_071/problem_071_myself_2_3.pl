use strict;
use warnings;

sub gcd {
  my ($a, $b)=@_;
  while ($b != 0) {
    my $t = $b;
    $b = $a % $b;
    $a = $t;
  }
  return $a;
}
my $max=$ARGV[0];
for (my $i=1;$i<=$max;$i++) {
  for (my $j=$i+1;$j<=$max;$j++) {
    if (gcd($i,$j)==1) {
      print "$i/$j ";
      print $i/$j*$max;
      print "\n";
    }
  }
}
