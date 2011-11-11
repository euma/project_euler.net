use strict;
use warnings;

#a recurrence for the partition function stating that:
#
#    p(k) = p(k − 1) + p(k − 2) − p(k − 5) − p(k − 7) + p(k − 12) + p(k − 15) − p(k − 22) − ...
#
#where p(0) is taken to equal 1, p(k) is zero for negative k, and the sum is taken over all generalized pentagonal numbers of the form ½n(3n − 1), for n running over positive and negative integers: successively taking n = 1, −1, 2, −2, 3, −3, 4, −4 ..., generates the values 1, 2, 5, 7, 12, 15, 22, 26, 35, 40, 51, .... The signs in the summation continue to alternate +, +, −, −, +, +, ...
my $mod=1000000;
my @p=();
$p[0]=1;
sub pentagonal_number {
  my $n=shift;
  return (3*$n*$n-$n)/2;
}
#my $n=10;
#for (my $i=1;$i<=$n;$i++) {
#  print pentagonal_number($i);
#  print "\n";
#}
#my $n=10;
#for (my $i=1;$i<=$n;$i++) {
#  print pentagonal_number($i); print "\n";
#  print pentagonal_number(-$i); print "\n";
#}
my $target=$ARGV[0];
for (my $k=1;$k<=$target;$k++) {
  my $i=1;
  while (1) {
    my $pi=pentagonal_number($i);
    if ($k-$pi < 0) { last; }
    $p[$k] += $p[$k-$pi];
    $pi=pentagonal_number(-$i);
    if ($k-$pi < 0) { last; }
    $p[$k] += $p[$k-$pi];
    $i++;
    $pi=pentagonal_number($i);
    if ($k-$pi < 0) { last; }
    $p[$k] -= $p[$k-$pi];
    $pi=pentagonal_number(-$i);
    if ($k-$pi < 0) { last; }
    $p[$k] -= $p[$k-$pi];
    $i++;
  }
  $p[$k] = $p[$k] % $mod;
  print "$k: $p[$k]\n";
  if ($p[$k] == 0) { print "\n$k\n"; last; }
}

