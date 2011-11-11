use strict;
use warnings;

#$n/$d 3/7 are neighboors in farey sequence
#so $d*3-$n*7=1;
#so $n=($d*3-1)/7;
sub gcd {
  my $a=shift;
  my $b=shift;
  while ($b > 0){
    $a = $a % $b;
    ($a,$b)=($b,$a);
  }
  return $a;
}

for (my $d=1000000;$d>=1;$d--) {
  print "$d\n";
  my $n=($d*3-1)/7;
  if ($n == int($n)) {
    if (gcd($n,$d)==1) {
      print "$n/$d\n";
      last;
    }
  }
}
