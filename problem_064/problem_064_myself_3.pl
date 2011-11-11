use strict;
use warnings;

my $limit=10;
my $max=25;
for (my $S=2;$S<=$max;$S++)
{
  my $num=sqrt($S);
  if ($num != int($num))
  {
    print "$S: ";
    my $m=0;
    my $d=1;
    my $a0=int(sqrt($S));
    my $a=$a0;
    my $index=0;
    my @mda_total=();
    my @cf=();
    while($index<$limit)
    {
      push(@cf,$a);
      #print "($m $d ($a))\t";
      my $mda_str=sprintf("%d,%d,%d",$m,$d,$a);
      push(@mda_total,$mda_str);
      $m=$d*$a-$m;
      $d=($S-$m*$m)/$d;
      $a=int(($a0+$m)/$d);
      my $new_mda_str=sprintf("%d,%d,%d",$m,$d,$a);
      for my $i (@mda_total)
      {
	if ($i eq $new_mda_str) {
	  #print "$i(find)\n";
	  print "*$a*";
	  last;
	}
      }
      $index++;
    }
    print "\n(@cf)\n============\n";
  }
}
