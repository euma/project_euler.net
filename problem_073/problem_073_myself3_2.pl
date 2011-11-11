use strict;
use warnings;

sub gcd {
  my $a=shift;
  my $b=shift;
  while ($b > 0){
    $a = $a % $b;
    ($a,$b)=($b,$a);
  }
  return $a;
}

my $start=1/3;
my $end=1/2;
my $n=$ARGV[0];
my $n_start=$n*$start;
my $n_end=$n*$end;
my $int_n_start=int($n_start);
my $int_n_end=int($n_end);
my $count=0;
while ($int_n_start < $int_n_end) {
  for (my $i=4;$i<=$n;$i++) {
    if ($int_n_start/$i>1/3 and $int_n_start/$i<1/2 and gcd($int_n_start,$i)==1) {
      print "$int_n_start/$i ";
      $count++;
    }
  }
  $int_n_start++;
}
print "\n$count\n";
