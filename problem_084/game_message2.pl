use strict;
use warnings;
use Math::Random::Secure qw(irand);

my @square=('GO',
  'A1','A2 ',
  'B1','B2','B3',
  'C1','C2','C3',
  'CC1','CC2','CC3',
  'CH1','CH2','CH3 ',
  'D1','D2','D3',
  'E1','E2','E3',
  'F1','F2','F3',
  'FP',
  'G1','G2','G3',
  'G2J ',
  'H1','H2',
  'JAIL',
  'R1','R2','R3','R4',
  'T1','T2',
  'U1','U2',
);

my $side6dice1= irand(6)+1;
my $side6dice2= irand(6)+1;
my $score=$side6dice1+$side6dice2;
print "$side6dice1 $side6dice2 $score\n";
print $#square+1; print "\n";
print 1/($#square+1); print "\n";
