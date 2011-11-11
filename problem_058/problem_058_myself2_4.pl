use strict;
use warnings;

my $largest=$ARGV[0];
my $limit=$largest*$largest;
my $sievebound = int(($limit-1) / 2);
my @sieve=();
foreach (0 .. $sievebound) {
  push(@sieve,0);
}
my $crosslimit = int((int(sqrt($limit)) -1) / 2);
for (my $i=1;$i<=$crosslimit;$i++) {
  if (not $sieve[$i]) {
    for (my $j=2*$i*($i+1);$j<=$sievebound;$j += (2*$i+1)) {
      $sieve[$j] = 1;
    }
  }
}
#for (my $i = 1;$i<=$sievebound;$i++) {
#  if (not $sieve[$i]) {
#    print 2*$i+1,"\n";
#  }
#}

#spiral_size is odd! so $spiral_size += 2!
for (my $spiral_size=7;$spiral_size<=$largest;$spiral_size+=2)
{
#my $spiral_size=7;
  my $max_step=($spiral_size-1)/2;
  my $sum=1;
  my $step=1;
  my $step_change=0;
  my $total_prime=0;
  while ($step<=$max_step) {
    $sum += 2*$step;
    #print "$sum\n";
    if ($step_change != 3 and (not $sieve[($sum-1)/2]))
    {
      #print "$sum is prime! ($step_change)\n";
      $total_prime++;
    }
    #else
    #{
    #  print "$sum ($step_change)\n";
    #}
    $step_change++;
    if ($step_change == 4) { $step++; $step_change=0; }
  }
  #print "$total_prime $total_all\n";
  my $total_all=4*$max_step+1;
  my $quot= $total_prime/$total_all;
  if ($quot < 0.1)
  {
    print "\n$quot ($spiral_size)\n";
    exit 0;
  }
  else
  {
    print "\n$quot ($spiral_size)\n";
  }

  print "\n-----------------\n";
}
