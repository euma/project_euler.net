use strict;
use warnings;

my $limit=10;
my $S=114;
my $m=0;
my $d=1;
my $a0=int(sqrt($S));
my $a=$a0;
my $n=0;
while($n<$limit)
{
  print "$a ";
  $m=$d*$a-$m;
  $d=($S-$m*$m)/$d;
  $a=int(($a0+$m)/$d);
  $n++;
}
print "\n";
