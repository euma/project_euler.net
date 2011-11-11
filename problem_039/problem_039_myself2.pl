use strict;
use warnings;

my $p_max_number=0;
my $largest_p=0;
for (my $p=2;$p<=1000;$p += 2) {
  my $p_number=0;
  for (my $a=1;$a<=$p-2;$a++) {
    for (my $b=$a+1;$b<=$p-$a-1;$b++) {
      my $left=$p*$p+2*$a*$b;
      my $right=2*$p*$a+2*$p*$b;
      if ($left == $right) {
        my $c = ($p-$a-$b);
        print "$p:$a $b $c\n";
        $p_number++;
      }
    }
  }
  if ($p_number > $p_max_number) {
    $p_max_number = $p_number;
    $largest_p = $p;
  }
}
print "\n$largest_p:$p_max_number\n";
