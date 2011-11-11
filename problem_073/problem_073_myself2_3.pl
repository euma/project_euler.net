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


my $N_max=$ARGV[0];
for (my $N=3;$N<$N_max;$N++) {

  print "$N: ";
  my $near_n=1;
  my $near_d=3;
  my $before_n=0;
  my $before_d=0;

  for (my $d=$N;$d>=1;$d--) {
    my $n=($d*$near_n-1)/$near_d;
    if ($n == int($n)) {
      if (gcd($n,$d)==1) {
	$before_n=$n;
	$before_d=$d;
	last;
      }
    }
  }
  #there from 1/3 to generate farey sequence and stop at 1/2
  my $NumTerms=0;
  my $A=$before_n;
  my $B=$before_d;
  my $C=1;
  my $D=3;
  while ($C<$N) {
    $NumTerms=$NumTerms+1;
    my $K=int(($N+$B)/$D);
    my $E=$K*$C-$A;
    my $F=$K*$D-$B;
    $A=$C;
    $B=$D;
    $C=$E;
    $D=$F;
    print "$A/$B";
    print "(";
    printf("%.1f", $A/$B*$N);
    print ") ";
    if ($A==1 and $B==2) { last; }
  }
  print $NumTerms-2;
  print "\n";
}
