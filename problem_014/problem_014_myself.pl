use strict;
use warnings;
sub count_sequence {
  my $n=shift;
  my $num=1;
  print "$n -- ";
  if ($n < 1) { exit 1; }
  while ($n != 1) {
    if ($n % 2 == 0) {
      $n /= 2;
    } else {
      $n = 3*$n+1;
    }
    print "$n -- ";
    $num++;
  }
  return $num;
}

for (my $i=1;$i<20;$i++) {
  print "( ",count_sequence($i)," )\n";
}
