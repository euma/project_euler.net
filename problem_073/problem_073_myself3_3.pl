use strict;
use warnings;

sub gcd {
  my $a=shift;
  my $b=shift;
  while ($b > 0){
    $a = $a % $b;
    ($a,$b)=($b,$a);
  }
  return $a;
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
