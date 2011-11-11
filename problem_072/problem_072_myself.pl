use strict;
use warnings;

sub farey {
  my $n=shift;
  my ($a, $b, $c, $d) = (0, 1,  1  , $n);
  print "$a/$b  ";
  while ($c < $n) {
    my $k = int(($n + $b)/$d);
    my $c_tmp=$c;
    my $d_tmp=$d;
    $c=$k*$c-$a;
    $d=$k*$d-$b;
    $a=$c_tmp;
    $b=$d_tmp;
    print "$a/$b  ";
  }
  print "\n";
}
my $n=$ARGV[0];
farey($n);
