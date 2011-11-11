use strict;
use warnings;

my @p=();
#my ($p[0], $n, $i, $m) = (1, 0, 1, 1e6);
$p[0]=1;
my $n=0;
my $i=1;
my $m=1e6;
 
my @k=();
for $i (1..250) {             #generate pentagonal numbers for generating function
  my $pi = $i*(3 * $i - 1)/2;
  push @k, $pi, $pi+$i;
}
 
while ($p[$n++]) {         #expand generating function to calculate p(n)
  my ($pi, $i) = (0, 0);
  $pi += ($i%4>1 ? -1 : 1 ) * $p[$n - $k[$i++]] while ($k[$i] <= $n); 
  $p[$n] = $pi % $m; 
} 
print "Answer to PE78 = ",$n-1;
