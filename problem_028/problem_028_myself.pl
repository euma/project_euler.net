use strict;
use warnings;

#$spiral_size is 1 3 5 7 ... (odd number)
#my $spiral_size=3;
#my $spiral_size=5;
#my $spiral_size=7;
my $spiral_size=1001;
my $max_step=($spiral_size-1);
$max_step /= 2;
my $sum=1;
my $whole_sum=1;
my $step=1;
my $step_change=0;
while ($step<=$max_step) {
  #print "$sum $step $step_change\n";
  $sum += 2*$step;
  print "$sum $step $step_change\n";
  $whole_sum += $sum;
  $step_change++;
  if ($step_change == 4) { $step++; $step_change=0; }
}
print "\n$whole_sum\n";
