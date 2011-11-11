use strict;
use warnings;
use bignum;

#a recurrence for the partition function stating that:
#
#    p(k) = p(k − 1) + p(k − 2) − p(k − 5) − p(k − 7) + p(k − 12) + p(k − 15) − p(k − 22) − ...
#
#where p(0) is taken to equal 1, p(k) is zero for negative k, and the sum is taken over all generalized pentagonal numbers of the form ½n(3n − 1), for n running over positive and negative integers: successively taking n = 1, −1, 2, −2, 3, −3, 4, −4 ..., generates the values 1, 2, 5, 7, 12, 15, 22, 26, 35, 40, 51, .... The signs in the summation continue to alternate +, +, −, −, +, +, ...
my $target=$ARGV[0];
my @p=();

open(my $in, '<', "pn.txt") or die $!;
my $count=0;
while (<$in>) {
  chomp $_;
  $p[$count]=$_;
  $count++;
}
close $in or die "$in: $!";

print STDOUT "\n-----file store before--------------------\n";
print STDOUT "count=$count\n";
for (my $i=0;$i<$count;$i++) {
  print STDOUT "$i: $p[$i]\n";
}
print STDOUT "\n-----new data into file--------------------\n";
open(my $out, '>>', "pn.txt") or die $!;
for (my $k=$count;$k<=$target;$k++) {
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
  use bignum;
  print STDOUT "$k: $p[$k]\n";
  print $out "$p[$k]\n";
  if ($p[$k] % 1000000 == 0) { print STDOUT "\nfind!\n"; last; }
}
close $out or die "$out: $!";

open(my $in, '<', "pn.txt") or die $!;
print STDOUT "\n-------file store after------------------\n";
$count=0;
while (<$in>) {
  print STDOUT $_;
  $count++;
}
print STDOUT "\ncount=$count\n";
close $in or die "$in: $!";
