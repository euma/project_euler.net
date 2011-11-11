use strict;
use warnings;

#works for The first two consecutive numbers
# The first three consecutive numbers
my $limit=$ARGV[0];
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
#  if (not $sieve[$i]) { print 2*$i+1,"\n"; }
#}

my @i_total;
for (my $i=1;$i<=$limit;$i++) {
  my $tmp_i=$i;
  my $i_times=0;
  my $first=1;
  while ($tmp_i % 2 == 0) {
    if ($first) { $i_times++; $first=0; }
    $tmp_i /= 2;
    #print "2 ";
  }
  for (my $i = 1;$i<=$sievebound;$i++) {
    if (not $sieve[$i]) {
      my $prime=2*$i+1;
      my $first=1;
      if ($prime > $tmp_i) { last; }
      while ($tmp_i % $prime == 0) {
        if ($first) { $i_times++; $first=0; }
        #print "$prime ";
        $tmp_i /= $prime;
      }
    }
  }
  #if ($i_times == 2) {
  #if ($i_times == 3) {
  my $times=4;
  if ($i_times == $times) {
    push(@i_total,$i);
    print "$i: ($times prime)\n";
    #} else {
    #print "($i_times prime)\n";
  }
}
#for (my $i=0;$i<$#i_total;$i++) {
#  if ($i_total[$i+1]-$i_total[$i] == 1) {
#    print "\n$i_total[$i]\n";
#    last;
#  }
#}
#for (my $i=0;$i<$#i_total-1;$i++) {
#  if ($i_total[$i+1]-$i_total[$i] == 1 and $i_total[$i+2]-$i_total[$i+1] == 1) {
#    print "\n$i_total[$i]\n";
#    last;
#  }
#}
for (my $i=0;$i<$#i_total-2;$i++) {
  if ($i_total[$i+1]-$i_total[$i] == 1 and $i_total[$i+2]-$i_total[$i+1] == 1 and $i_total[$i+3]-$i_total[$i+2] == 1) {
    print "\n$i_total[$i]\n";
    last;
  }
}
