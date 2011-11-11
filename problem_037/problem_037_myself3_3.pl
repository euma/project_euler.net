use strict;
use warnings;
#use bignum;

#step 1 get prime array!
my $limit = $ARGV[0];
my $crosslimit = int(sqrt($limit));
my @sieve = (1,1);
for (my $i = 2;$i<=$limit;$i++) {
  push(@sieve,0);
}
# mark even numbers > 2
for (my $n = 4; $n<= $limit; $n += 2) {
  $sieve[$n] = 1;
}
for (my $n = 3; $n<= $crosslimit; $n += 2) {
  # n not marked, hence prime
  if (not $sieve[$n]) {
    for (my $m = $n*$n; $m<=$limit; $m += 2*$n) {
      $sieve[$m] = 1;
    }
  }
}
my $index=0;
my $sum=0;
for (my $i = 2; $i<=$limit; $i++) {
  if (not $sieve[$i]) {
    if ($i =~ /^2(\d+)$/) {
      my $tmp=$1;
      if ($tmp !~ /[02468]/) {
        my $l=length($i);
        my $is_truncatable_prime=1;
        for (my $j=1;$j<$l;$j++) {
          $i =~ /\d(\d{$j})$/;
          if ($sieve[$1]) {
            $is_truncatable_prime=0;
            last;
          }
          $i =~ /^(\d{$j})\d/;
          if ($sieve[$1]) {
            $is_truncatable_prime=0;
            last;
          }
        }
        if($is_truncatable_prime and $i>10) { print "$index:$i\n"; $sum += $i; $index++; }
      }
    } else {
      my $l=length($i);
      my $is_truncatable_prime=1;
      for (my $j=1;$j<$l;$j++) {
        $i =~ /\d(\d{$j})$/;
        if ($sieve[$1]) {
          $is_truncatable_prime=0;
          last;
        }
        $i =~ /^(\d{$j})\d/;
        if ($sieve[$1]) {
          $is_truncatable_prime=0;
          last;
        }
      }
      if($is_truncatable_prime and $i>10) { print "$index:$i\n"; $sum += $i; $index++; }
    }
  }
}
print "\n",$sum,"\n";
