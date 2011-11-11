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
sub is_prime {
  my $n=shift;
  if ($n<2) {
    return 0;
  } elsif ($n==2) {
    return 1;
  } elsif ($n%2 == 0) {
    return 0;
  } else {
    my $is_prime=1;
    for(my $factor=3;$factor<=sqrt($n);$factor=$factor+2) {
      if ($n % $factor == 0) {
        return 0;
      }
    }
    return 1;
  }
}
my $start=123456789;
my $end=987654321;
my $largest=0;
for (my $i=$start;$i<=$end;$i += 2) {
  if (is_pandigital9($i)) {
    if (is_prime($i)) {
      if ($i > $largest) {
        $largest = $i;
        print $i,"\n";
      }
    }
  }
}
print "\n$largest\n";
