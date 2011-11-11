use strict;
use warnings;

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
