use strict;
use warnings;

sub is_pandigital9 {
  my $n=shift;
  if (length($n) == 9) {
    if ($n !~ /0/) {
      my @split_n=split("",$n);
      my @seen = ();
      foreach (0 .. 9) {
        push(@seen,0);
      }
      for (my $i=0;$i<=$#split_n;$i++) {
        $seen[$split_n[$i]]++;
      }
      foreach (1 .. 9) {
        if ($seen[$_] >1) { return 0; }
      }
      return 1;
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}

#my $start=(123456789-1)/2;

#my $largest=0;
#
#    my $prime=2*$i+1;
#    if (is_pandigital9($prime)) {
#      if ($prime > $largest) { $largest = $prime; }
#      print "$prime\n";
#    }
#print "\n$largest\n";

#my $end=987654321;
my $limit=987654321;
#my $limit=987;
#this number is very large!
my $sievebound = int(($limit-1) / 2);
print "$sievebound\n";
my @sieve=();
foreach (0 .. $sievebound) {
  push(@sieve,0);
}
my $crosslimit = int((int(sqrt($limit)) -1) / 2);
print "$crosslimit\n";
for (my $i=1;$i<=$crosslimit;$i++) {
  if (not $sieve[$i]) {
    for (my $j=2*$i*($i+1);$j<=$sievebound;$j += (2*$i+1)) {
      $sieve[$j] = 1;
    }
  }
}
for (my $i = 1;$i<=$sievebound;$i++) {
  if (not $sieve[$i]) { print 2*$i+1," -- "; }
}

