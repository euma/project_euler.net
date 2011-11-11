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
my $n=$ARGV[0];
my $count=0;
for (my $q=4;$q<=$n;$q++) {
  for (my $p=$q-1;$p>=2;$p--) {
    #1/3<p/q<1/2 gets q<3p, 2p<q
    if ($q<3*$p and 2*$p<$q and gcd($p,$q)==1) {
      print "$p/$q ";
      $count++;
    }
  }
}
print "\n$count\n";
