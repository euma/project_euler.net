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
sub prime_times {
  my $n=shift;
  if ($n < 2) {
    return 0;
  }
  my $tmp_n=$n;

  my $n_times=0;
  my $first=1;
  while ($tmp_n % 2 == 0) {
    if ($first) { $n_times++; $first=0; }
    $tmp_n /= 2;
  }
  for (my $i = 1;$i<=$sievebound;$i++) {
    if (not $sieve[$i]) {
      my $prime=2*$i+1;
      my $first_happen=1;
      if ($prime > $tmp_n) { last; }
      while ($tmp_n % $prime == 0) {
        if ($first_happen) { $n_times++; $first_happen=0; }
        $tmp_n /= $prime;
      }
    }
  }
  return $n_times;
}
#for (my $i=0;$i<=$limit;$i++) {
#  print "$i: ",prime_times($i),"\n";
#}
#for (my $i=0;$i<=$limit-1;$i++) {
#  if (prime_times($i) == 2 and prime_times($i+1) == 2) {
#    print "$i\n";
#    last;
#  }
#}
#for (my $i=0;$i<=$limit-2;$i++) {
#  if (prime_times($i) == 3 and prime_times($i+1) == 3 and prime_times($i+2) == 3) {
#    print "$i\n";
#    last;
#  }
#}
for (my $i=0;$i<=$limit-3;$i++) {
  if (prime_times($i) == 4 and prime_times($i+1) == 4 and prime_times($i+2) == 4 and prime_times($i+3) == 4) {
    print "$i\n";
    last;
  }
}
