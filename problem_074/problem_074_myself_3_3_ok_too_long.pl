use strict;
use warnings;

my @factorial = (1, 1, 2, 6, 24, 120, 720, 5_040, 40_320, 362_880);
sub factorial_digit {
  my $n=shift;
  my @split_n=split("",$n);
  my $tmp=0;
  foreach (@split_n) {
    $tmp += $factorial[$_];
  }
  return $tmp;
}
my $n_max=$ARGV[0];
my %seen_n=();
my $count_60=0;
for (my $i=1;$i<$n_max;$i++) {
  if (not $seen_n{$i}) {
    print "$i: ";
    my $n=$i;
    my %seen=();
    my $count=0;
    while (not $seen{$n}) {
      $seen{$n}=1;
      $seen_n{$n}=1;
      $count++;
      #print "$n ";
      $n=factorial_digit($n);
    }
    print "\n";
    if ($count == 60) {
      $count_60++;
      print "count=$count\n";
    }
  }
}
print "\n$count_60\n";
