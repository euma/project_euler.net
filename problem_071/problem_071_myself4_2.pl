use strict;
use warnings;

my $max=$ARGV[0];
my $n=3/7*$max;
print "$n\n";
sub gcd {
  my ($a, $b)=@_;
  while ($b != 0) {
    my $t = $b;
    $b = $a % $b;
    $a = $t;
  }
  return $a;
}
my $min=$max;
my $min_i=0;
my $min_j=0;
for (my $i=1;$i<=$max;$i++) {
  print "$i\n";
  for (my $j=$i+1;$j<=$max;$j++) {
    if (gcd($i,$j)==1) {
      my $ij=$i/$j;
      my $division=3/7-$ij;
      if ($division > 0) {
	if ($division < $min) { $min=$division;$min_i=$i;$min_j=$j; }
      }
    }
  }
}
print "$min_i/$min_j\n";
print $min;
print "\n";
