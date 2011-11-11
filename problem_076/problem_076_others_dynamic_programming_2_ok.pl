use strict;
use warnings;

#func count( n, m )
#  initialize table with base cases
#
#  for i from 0 to n
#    for j from 0 to m
#      table[ i, j ] = table[ i - S_j, j ] + table[ i, j - 1 ]
#
#  return table[ n, m ]
sub count {
  my ($n,$m,$S_ref)=@_;
  #initialize table with base cases
  my %table=();

  for (my $i=0;$i<=$n;$i++) {
    for (my $j=0;$j<=$m;$j++) {
      my $n1=$i-$S_ref->[$j];
      my $m1=$j;
      my $n2=$i;
      my $m2=$j-1;

      if ($n1 == 0) { $table{$n1}{$m1}=1; }
      elsif ($n1 < 0) { $table{$n1}{$m1}=0; }
      elsif ($m1 < 0 and $n1 >= 1) { $table{$n1}{$m1}=0; }

      if ($n2 == 0) { $table{$n2}{$m2}=1; }
      elsif ($n2 < 0) { $table{$n2}{$m2}=0; }
      elsif ($m2 < 0 and $n2 >= 1) { $table{$n2}{$m2}=0; }

      $table{$i}{$j} = $table{$n1}{$m1} + $table{$n2}{$m2};
    }
  }
  return $table{$n}{$m};
}
my $n=$ARGV[0];
my @S=(1 .. $n-1);
print count($n,$#S,\@S);
print "\n";
