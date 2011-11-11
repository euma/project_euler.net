use strict;
use warnings;
#P1:
#P2:
#P5:
#P10:
#P20:
#P50:
#P100:
#P200:
my $limit=200;
my $n=1;
for (my $P1 = 0;$P1<=$limit;$P1++) {
  my $n1 = $P1;
  for (my $P2 = 0;$P2<=$limit - $n1;$P2 += 2) {
    my $n2 = $n1 + $P2;
    for (my $P5 = 0;$P5<=$limit - $n2;$P5 += 5) {
      my $n5 = $n2 + $P5;
      for (my $P10 = 0;$P10<=$limit - $n5;$P10 += 10) {
        my $n10 = $n5 + $P10;
        for (my $P20 = 0;$P20<=$limit - $n10;$P20 += 20) {
           my $n20 = $n10 + $P20;
           for (my $P50 = 0;$P50<$limit - $n20;$P50 += 50) {
             my $n50 = $n20 + $P50;
             for (my $P100 = 0; $P100<=$limit - $n50;$P100 += 100) {
               my $n100 = $n50 + $P100;
               for (my $P200 = 0;$P200<=$limit - $n100;$P200 += 200) {
                 if ($n100 + $P200 == $limit) {
                   $n = $n + 1;
                 }
              }
            }
          }
        }
      }
    }
  }
}
print $n,"\n";
