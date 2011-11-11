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

my $target=$ARGV[0];
#a+b+c<=target
#a=k(m*m-n*n)
#b=k(2m*n)
#c=k(m*m+n*n)
#a+b+c=2km(m+n)
#2km(m+n)<=target
#km(m+n)<=target/2
#k>=1
#m(m+n)<=km(m+n)<=target/2
#n>=1,m>n
#mm<m(m+n)<=km(m+n)<=target/2
#mm<target/2
my $target2 = $target / 2;
my $mlimit = sqrt($target2);
#n>=1,m>n, so m>=2
for (my $m = 2;$m<$mlimit;$m++) {
  for (my $n = $m-1;$n>0;$n--) {
    if (($m-$n) % 2 == 1 and gcd($m,$n) == 1) {
      for (my $k=1;$k<=$target/($m*($m+$n)*2);$k++) {
	my $a=$k*($m*$m-$n*$n);
	my $b=$k*(2*$m*$n);
	my $c=$k*($m*$m+$n*$n);
	print $a + $b + $c;
	print ": $a $b $c\n";
      }
    }
  }
}
