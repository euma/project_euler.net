use strict;
use warnings;

sub gcd {
  my ($a, $b)=@_;
  while ($b != 0) {
    my $t = $b;
    $b = $a % $b;
    $a = $t;
  }
  return $a;
}
my $max=$ARGV[0];
my @rat_arr=();
my @rat_float_arr=();
for (my $i=1;$i<=$max;$i++) {
  for (my $j=$i+1;$j<=$max;$j++) {
    if (gcd($i,$j)==1) {
      my @rat=($i,$j);push(@rat_arr,\@rat);
      my $rat_float=$i/$j;push(@rat_float_arr,$rat_float);
    }
  }
}
print "\n-------------get rational array---------------------\n";
print join(" -- ",@rat_float_arr);
print "\n";
for(my $i=0;$i<=$#rat_arr;$i++){
  for(my $j=0;$j<=$#{$rat_arr[$i]};$j++) {
    print "$rat_arr[$i][$j] ";
  }
  print "\n";
}
