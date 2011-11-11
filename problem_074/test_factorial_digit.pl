use strict;
use warnings;

sub factorial {
  my $n=shift;
  if ($n == 0) { return 1;}
  elsif ($n == 1) { return 1;}
  elsif ($n == 2) { return 2;}
  elsif ($n == 3) { return 6;}
  elsif ($n > 3 ) {
    my $tmp=1;
    for (my $i=2;$i<=$n;$i++) {
      $tmp *= $i;
    }
    return $tmp;
  } else { return -1;}
}
sub factorial_digit {
  my $n=shift;
  my @split_n=split("",$n);
  print "\n";
  print join(" ",@split_n);
  print "\n";
  my $tmp=0;
  foreach (@split_n) {
    $tmp += factorial($_);
    print factorial($_);
    print " + ";
  }
  print "\n";
  return $tmp;
}
my $n=$ARGV[0];
my %seen=();
my $count=0;
while (not $seen{$n}) {
  $seen{$n}=1;
  $count++;
  print "$n ";
  $n=factorial_digit($n);
}
print "count=$count\n";
