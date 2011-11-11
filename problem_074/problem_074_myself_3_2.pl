use strict;
use warnings;

sub factorial {
  my $n=shift;
  #there 0! = 1, 1!=1, 2!=2, 3!=6
  if ($n == 0) { return 1;}
  elsif ($n == 1) { return 1;}
  elsif ($n == 2) { return 2;}
  elsif ($n == 3) { return 6;}
  elsif ($n == 4) { return 24;}
  elsif ($n == 5) { return 120;}
  elsif ($n == 6) { return 720;}
  elsif ($n == 7) { return 5040;}
  elsif ($n == 8) { return 40320;}
  elsif ($n == 9) { return 362880;}
  else { return -1;}
}
sub factorial_digit {
  my $n=shift;
  my @split_n=split("",$n);
  my $tmp=0;
  foreach (@split_n) {
    $tmp += factorial($_);
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
