use strict;
use warnings;

sub factorial {
  my $n=shift;
  my $tmp=1;
  for (my $i=1;$i<=$n;$i++) {
    $tmp *= $i;
  }
  return $tmp;
}
my $n=$ARGV[0];
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
print "\n$count\n";
