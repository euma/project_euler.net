use strict;
use warnings;

sub is_pandigital {
  my $n=shift;
  my $digit=shift;
  if (length($n) == $digit) {
    if ($n !~ /0/) {
      my @split_n=split("",$n);
      my @seen = ();
      foreach (0 .. $digit) {
        push(@seen,0);
      }
      for (my $i=0;$i<=$#split_n;$i++) {
        $seen[$split_n[$i]]++;
      }
      foreach (1 .. $digit) {
        if ($seen[$_] != 1 ) { return 0; }
      }
      return 1;
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}
#if (is_pandigital(2143,4)) {
#  print "yes!\n";
#} else {
#  print "no!\n";
#}
sub is_prime {
    my $n=shift;
    if ($n <= 1) { return 0; }
    elsif ($n < 4) { return 1; }
    elsif ($n % 2 == 0) { return 0; }
    elsif ($n < 9) { return 1; }
    elsif ($n % 3 == 0) { return 0; }
    else {
        my $r=int(sqrt($n));
        my $f=5;
        while ($f<=$r) {
            if ($n % $f == 0) { return 0; }
            if (($n % ($f+2)) == 0) { return 0; }
            $f = $f + 6;
        }
        return 1;
    }
}

my $largest=0;
#my $digit_max=3;
my $digit_max=$ARGV[0];
for (my $j=2;$j<=$digit_max;$j++) {
  my $start=10**$j-1;
  my $end=10**($j-1)+1;
  #print "$start $end\n";
  for (my $i=$start;$i>=$end;$i -= 2) {
  #for (my $i=$start;$i>=$end;$i--) {
    if ($i !~ /5$/) {
      if (is_pandigital($i,$j)) {
        #print $i," is pandigital $j\n";
        if (is_prime($i)) {
          if ($i> $largest) { $largest = $i; }
          print $i," is pandigital $j and prime!\n";
        #last;
        }
      }
    }
  }
}
print "\n$largest\n";
