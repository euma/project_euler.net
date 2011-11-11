use strict;
use warnings;
use POSIX;

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

my $p_max_times=0;
my $p_max_number=0;
for (my $p=4;$p<=1000;$p +=2) {
  my $p_times=0;
  my $p2 = $p / 2;
  my $mlimit = ceil(sqrt($p2))-1;
  for (my $m = 2;$m<=$mlimit;$m++) {
    if ($p2 % $m == 0) {
      my $pm = $p2 / $m;
      while ($pm % 2 == 0) {
        $pm = $pm / 2;
      }
      my $k;
      if ($m % 2 == 1) { $k = $m+2; }
      else { $k = $m+1; }
      while ($k < 2*$m && $k <= $pm) {
        if ($pm % $k == 0 && gcd($k,$m) == 1) {
          my $d = $p2 / ($k*$m);
          my $n = $k-$m;
          my $a = $d*($m*$m-$n*$n);
          my $b = 2*$d*$m*$n;
          my $c = $d*($m*$m+$n*$n);
          print "$a,$b,$c\n";
          $p_times++;
        }
        $k = $k+2;
      }
    }
  }
  if ($p_times > $p_max_times) {
    $p_max_times = $p_times;
    $p_max_number=$p;
  }
}
print "\n$p_max_number: $p_max_times\n";
