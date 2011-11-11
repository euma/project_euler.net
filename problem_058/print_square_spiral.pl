use strict;
use warnings;
my $largest=10;
my $max_step=($largest-1)/2;
my $sum=1;
my $step=1;
my $step_change=0;
my $total_prime=0;
while ($step<=$max_step) {
  $sum += 2*$step;
  print "$sum\n";
  $step_change++;
  if ($step_change == 4)
  {
    $step++;
    $step_change=0;
    print "\n";
  }
}
