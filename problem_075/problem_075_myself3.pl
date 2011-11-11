use strict;
use warnings;

sub gcd {
  my ($u,$v) = @_;
  my $shift_number; 
  if ($u == 0 || $v == 0) { return $u | $v; } 
  for ($shift_number = 0; (($u | $v) & 1) == 0; ++$shift_number) {
    $u >>= 1;
    $v >>= 1;
  }
  while (($u & 1) == 0) {
    $u >>= 1;
  } 
  do {
    while (($v & 1) == 0) {
      $v >>= 1; 
    }
    if ($u < $v) {
      $v -= $u;
    } else {
      my $diff = $u - $v;
      $u = $v;
      $v = $diff;
    }
    $v >>= 1;
  } while ($v != 0);

  return $u << $shift_number;
}

my $s=$ARGV[0];
my $s2 = $s / 2;
my $mlimit = sqrt($s2)-1;
for (my $m = 2;$m<$mlimit;$m++) {
  if ($s2 % $m == 0) {
    my $sm = $s2 / $m;
    while ($sm % 2 == 0) { # reduce the search space by removing all factors 2
      $sm = $sm / 2;
    }
    my $k;
    if ($m % 2 == 1) { $k = $m+2; }
    else { $k = $m+1; }
    while ($k < 2*$m && $k <= $sm) {
      if ($sm % $k == 0 && gcd($k,$m) == 1) {
        my $d = $s2 / ($k*$m);
        my $n = $k-$m;
        my $a = $d*($m*$m-$n*$n);
        my $b = 2*$d*$m*$n;
        my $c = $d*($m*$m+$n*$n);
        print "$a,$b,$c\n";
      }
      $k = $k+2;
    }
  }
}
