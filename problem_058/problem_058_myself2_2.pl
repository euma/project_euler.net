use strict;
use warnings;

my $limit=$ARGV[0];
for (my $spiral_size=7;$spiral_size<=$limit;$spiral_size++)
{
#my $spiral_size=7;
  my $limit=$spiral_size*$spiral_size;
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
  my $max_step=($spiral_size-1);
  $max_step /= 2;
  my $sum=1;
  my $step=1;
  my $step_change=0;
  my $total_prime=0;
  my $total_all=1; #there I must count start number 1; 1 is not prime!
  while ($step<=$max_step) {
    $sum += 2*$step;
    #print "$sum\n";
    if ($sum % 5 != 0 and $sum % 3 !=0 and $step_change != 3 and (not $sieve[($sum-1)/2]))
    {
      #print "$sum is prime! ($step_change)\n";
      $total_prime++;
    }
    #else
    #{
    #  print "$sum ($step_change)\n";
    #}
    $total_all++;
    $step_change++;
    if ($step_change == 4) { $step++; $step_change=0; }
  }
  #print "$total_prime $total_all\n";
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
