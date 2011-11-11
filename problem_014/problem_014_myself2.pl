use strict;
use warnings;
sub count_sequence {
  my $n=shift;
  my $num=1;
  if ($n < 1) { exit 1; }
  while ($n != 1) {
    if ($n % 2 == 0) {
      $n /= 2;
    } else {
      $n = 3*$n+1;
    }
    $num++;
  }
  return $num;
}
my $max = 1;
my $max_i = 1;
for (my $i=1;$i<=1000000;$i++) {
  if (count_sequence($i) > $max) { $max = count_sequence($i); $max_i = $i; }
}
print "\n$max and $max_i\n";
