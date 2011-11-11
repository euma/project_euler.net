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
my %rat_arr=();
my @rat_str_arr=();
for (my $i=1;$i<=$max;$i++) {
  for (my $j=$i+1;$j<=$max;$j++) {
    if (gcd($i,$j)==1) {
      my $rat_str="$i/$j";
      my $rat_float=$i/$j;
      $rat_arr{$rat_str}=$rat_float;
      push(@rat_str_arr,$rat_str);
    }
  }
}
print "before :",join(" - ",@rat_str_arr),"\n";
for (my $i=0;$i<scalar(@rat_str_arr);$i++) {
  for (my $j=scalar(@rat_str_arr)-1;$j>$i;$j--) {
    if ($rat_arr{$rat_str_arr[$j]}<$rat_arr{$rat_str_arr[$j-1]}) {
      my $tmp=$rat_str_arr[$j];
      $rat_str_arr[$j]=$rat_str_arr[$j-1];
      $rat_str_arr[$j-1]=$tmp;
    }
  }
}
#print "after :",join(" - ",@rat_str_arr),"\n";
print "after :";
for (my $i=0;$i<=$#rat_str_arr;$i++) {
  print "$rat_str_arr[$i] - ";
  #print "$rat_arr{$rat_str_arr[$i]}\n";
  print $rat_arr{$rat_str_arr[$i]}*$max;
  print "\n";
}
print "\n";
