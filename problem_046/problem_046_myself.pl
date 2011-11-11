use strict;
use warnings;

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
my @primes=();
for (my $i = 5;$i<=$sievebound;$i++) {
  if (not $sieve[$i]) {
    push(@primes,2*$i+1);
  }
}
#print join(" -- ",@primes),"\n\n";
my @odds=();
for (my $i=4;(2*$i+1)<$limit;$i++) {
  push(@odds,2*$i+1);
}
#print join(" -- ",@odds),"\n\n";
my @odd_composite=grep{ not $_ ~~ @primes} @odds;
#print join(" -- ",@odd_composite),"\n\n";
#
for my $i (@odd_composite) {
  my $i_times=0;
  for (my $j=1;$j<=sqrt($i/2-1);$j++) {
    my $test=$i-2*$j*$j;
    #if (is_prime($test)) {
    if ($test % 2 == 1) {
      if (not $sieve[($test-1)/2]) {
        print "$i = $test + 2x$j^2\n";
        $i_times++;
      }
    }
  }
  if ($i_times < 1) { print "$i: $i_times(0)\n"; last; }
  else { print "$i: $i_times\n"; }
}
