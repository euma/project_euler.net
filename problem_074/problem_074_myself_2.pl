use strict;
use warnings;

sub factorial {
  my $n=shift;
  my $tmp=1;
  for (my $i=1;$i<=$n;$i++) {
    $tmp *= $i;
  }
  #there 0! return 1
  return $tmp;
}
my $n_max=$ARGV[0];
for (my $i=1;$i<$n_max;$i++) {
  my $n=$i;
  print "$n: ";
  my %seen=();
  my $count=0;
  while (not $seen{$n}) {
    my @split_n=split("",$n);
    my $tmp=0;
    foreach (@split_n) {
      $tmp += factorial($_);
    }
    $seen{$n}=1;
    $count++;
    print "$n ";
    $n=$tmp;
  }
  print "count=$count\n";
  if ($count == 60) { last; }
}
