use strict;
use warnings;

my $target=$ARGV[0];
my $limit = int(sqrt($target));
for (my $i=1;$i<$limit;$i+=2) {
  for (my $j=$i+1;$j<$limit;$j+=2) {
    my $a = $j * $j - $i * $i;
    my $b = 2 * $i * $j;
    my $c = $i * $i + $j * $j;
    if ($a+$b+$c == $target) {
      print "$a $b $c\n";
    }
  }
}
