use strict;
use warnings;

my $n=$ARGV[0];
my $count=0;
my ($a, $b, $c, $d) = (0, 1,  1  , $n);
#print "$a/$b  ";
while ($c < $n) {
  my $k = int(($n + $b)/$d);
  my $c_tmp=$c;
  my $d_tmp=$d;
  $c=$k*$c-$a;
  $d=$k*$d-$b;
  $a=$c_tmp;
  $b=$d_tmp;
  if ($a/$b >  1/3 and $a/$b < 1/2) {
    print "$a/$b  ";
    $count++;
  }
}
print "\n$count\n";
