use strict;
use warnings;
my $largest=$ARGV[0];
if ($largest % 2 == 0) {
  $largest++;
}
my $limit=$largest*$largest-($largest-1);
my $sievebound = int(($limit-1) / 2);
my @sieve=();
for (my $i=0;$i<=$sievebound;$i++) {
  $sieve[$i]=0;
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
my $max_step=($largest-1)/2;
my $sum=1;
my $step=1;
my $step_change=0;
my $total_prime=0;
while ($step<=$max_step) {
  $sum += 2*$step;
  if ($step_change != 3 and (not $sieve[($sum-1)/2]))
  {
    #print "*$sum*\n";
    $total_prime++;
  }
  $step_change++;
  if ($step_change == 4)
  {
    my $total_all=4*$step+1;
    my $spiral_size=2*$step+1;
    my $quot= $total_prime/$total_all;
    print "$spiral_size: ";
    print "$total_prime/$total_all = ";
    print "$quot\n";
    $step++;
    $step_change=0;
  }
}
#if ($quot < 0.1)
#{
#  print "\n$quot ($spiral_size)($total_all)\n";
#  exit 0;
#}
#else
#{
#  print "\n$quot ($spiral_size)($total_all)\n";
#}
#print "\n--------------------\n";
#print "3: 3/5 = ",3/5,"\n";
#print "5: 5/9 = ",5/9,"\n";
#print "7: 8/13 = ",8/13,"\n";
