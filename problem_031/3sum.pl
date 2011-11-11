use strict;
use warnings;

#sort(S);
my @S=(-2,-1,1,2);
my $n=$#S+1;
for (my $i=0; $i<=$n-3;$i++) {
  my $a = $S[$i];
  my $k = $i+1;
  my $l = $n-1;
  while ($k<$l) {
    my $b = $S[$k];
    my $c = $S[$l];
    if ($a+$b+$c == 0) {
      print "$a $b $c\n";
      exit 0;
    } elsif ($a+$b+$c > 0) {
          $l = $l - 1;
    } else {
          $k = $k + 1;
    }
  }
}
