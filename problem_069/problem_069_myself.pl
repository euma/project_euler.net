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
my $target=$ARGV[0];
my $max_value=-1;
my $max_n=0;
for (my $n=2;$n<=$target;$n++) {
  my $totient=1;
  #print "1 ";
  my $str="$n: 1 ";
  for (my $i=2;$i<$n;$i++)
  {
    if (gcd($i,$n) == 1) {
      #print "$i ";
      $str = $str."$i ";
      $totient++;
    }
  }
  printf("%s",$str);
  my $space=5+$target-length($str);
  for (my $i=0;$i<$space;$i++)
  {
    print " ";
  }
  print "  $totient ";
  #print $n/$totient;
  my $value=$n/$totient;
  if ($value > $max_value) { $max_value=$value; $max_n=$n; }
  print "\n";
}
print "\n$max_value\n";
print "\n$max_n\n";
