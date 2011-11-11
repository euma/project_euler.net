use strict;
use warnings;
use bignum;

#a recurrence for the partition function stating that:
#
#    p(k) = p(k − 1) + p(k − 2) − p(k − 5) − p(k − 7) + p(k − 12) + p(k − 15) − p(k − 22) − ...
#
#where p(0) is taken to equal 1, p(k) is zero for negative k, and the sum is taken over all generalized pentagonal numbers of the form ½n(3n − 1), for n running over positive and negative integers: successively taking n = 1, −1, 2, −2, 3, −3, 4, −4 ..., generates the values 1, 2, 5, 7, 12, 15, 22, 26, 35, 40, 51, .... The signs in the summation continue to alternate +, +, −, −, +, +, ...
my @p=();
$p[0]=1;
my $target=$ARGV[0];
print "($p[0],\n";
for (my $k=1;$k<=$target;$k++) {
  my $i=1;
  while (1) {
    my $pi=(3*$i*$i-$i)/2;
    if ($k-$pi < 0) { last; }
    $p[$k] += $p[$k-$pi];
    $pi=(3*$i*$i+$i)/2;
    if ($k-$pi < 0) { last; }
    $p[$k] += $p[$k-$pi];
    $i++;
    $pi=(3*$i*$i-$i)/2;
    if ($k-$pi < 0) { last; }
    $p[$k] += -$p[$k-$pi];
    $pi=(3*$i*$i+$i)/2;
    if ($k-$pi < 0) { last; }
    $p[$k] += -$p[$k-$pi];
    $i++;
  }
  print "$p[$k],\n";
}
print ")\n";
