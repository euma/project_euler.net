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
for (my $i=2;$i<=$max;$i++) {
  print "1/$i\n";
}
print "\n------------------\n";
for (my $i=2;$i<=$max;$i++) {
  for (my $j=$i+1;$j<=$max;$j++) {
    if ($j % $i != 0 and gcd($i,$j)==1) {
      print "$i/$j\n";
    }
  }
  print "\n------------------\n";
}
