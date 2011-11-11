use strict;
use warnings;

sub farey {
  my $n=shift;
  my $total=0;
  my ($a, $b, $c, $d) = (0, 1,  1  , $n);
  #print "$a/$b  ";
  $total++;
  while ($c < $n) {
    my $k = int(($n + $b)/$d);
    my $c_tmp=$c;
    my $d_tmp=$d;
    $c=$k*$c-$a;
    $d=$k*$d-$b;
    $a=$c_tmp;
    $b=$d_tmp;
    #print "$a/$b  ";
    $total++;
  }
  print "($total)\n";
}
my $max=$ARGV[0];
for (my $n=2;$n<=$max;$n++) {
  print "$n: ";
  farey($n);
}
