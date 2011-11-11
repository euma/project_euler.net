use strict;
use warnings;

my $limit=$ARGV[0];
for (my $max=2;$max<=$limit;$max++)
{
  my $limit=4*$max*$max+2*$max+1;#$p*$q=$max;
  my $total_composite=0;
  for (my $p=3;$p<=$limit/3;$p+=2)
  {
    for (my $q=$p;$q<=$limit/$p;$q+=2)
    {
      my $num=(sqrt(4*$p*$q-3)-1)/4;
      if ($num != 1 and $num == int($num)) {
	$total_composite++;
      }
      $num=sqrt($p*$q-1)/2;
      if ($num != 1 and $num == int($num)) {
	$total_composite++;
      }
      $num=(sqrt(4*$p*$q-3)+1)/4;
      if ($num != 1 and $num == int($num)) {
	$total_composite++;
      }
    }
  }
  my $total_all=4*$max+1;
  my $spiral_size=2*$max+1;
  $total_composite +=$max+1;
  my $quot=1-($total_composite)/$total_all;
  print "$spiral_size: ";
  print $total_all-$total_composite;
  print "/$total_all = ";
  print "$quot\n";
}
