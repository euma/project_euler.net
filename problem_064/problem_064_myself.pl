use strict;
use warnings;

my $limit=10;
my $S=114;
my $m=0;
my $d=1;
my $a0=int(sqrt($S));
my $a=$a0;
my $n=0;
my @mda_total=();
while($n<$limit)
{
  #print "$a $m $d\n";
  print "$m $d $a\n";
  my @mda=($m,$d,$a);
  push(@mda_total,\@mda);
  $m=$d*$a-$m;
  $d=($S-$m*$m)/$d;
  $a=int(($a0+$m)/$d);
  $n++;
}
print "\n============\n";
for my $i (@mda_total)
{
  for my $j (@{$i})
  {
    print "$j ";
  }
  print "\n";
}
print "\n";
print "\n";
