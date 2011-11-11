use strict;
use warnings;

my $near_n=1;
my $near_d=3;
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

for (my $d=12000;$d>=1;$d--) {
  print "$d\n";
  my $n=($d*$near_n-1)/$near_d;
  if ($n == int($n)) {
    if (gcd($n,$d)==1) {
      print "$n/$d\n";
      last;
    }
  }
}
#there from 1/3 to generate farey sequence and stop at 1/2
my $N=$ARGV[0];
my $NumTerms=1;
my $A=0;
my $B=1;
my $C=1;
my $D=$N;
print "$A/$B ";
while ($C<$N) {
  $NumTerms=$NumTerms+1;
  my $K=int(($N+$B)/$D);
  my $E=$K*$C-$A;
  my $F=$K*$D-$B;
  $A=$C;
  $B=$D;
  $C=$E;
  $D=$F;
  print "$A/$B ";
  if ($A==1 and $B==3) { last; }
}
print "\n";
print $NumTerms;
print "\n";
