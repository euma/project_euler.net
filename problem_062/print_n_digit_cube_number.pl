use strict;
use warnings;
my $limit=$ARGV[0];
for (my $digit=1;$digit<=$limit;$digit++)
{
  my $start=10**($digit-1);
  my $end=10**$digit-1;
  #print "$start $end\n";
  my $start_cube=0;
  my $num=$start**(1/3);
  if ($num == int($num)) {$start_cube=$num;}
  else {$start_cube=int($num)+1;}

  my $end_cube=0;
  $num=$end**(1/3);
  if ($num == int($num)) {$end_cube=$num;}
  else {$end_cube=int($num);}

  for(my $i=$start_cube;$i<=$end_cube;$i++)
  {
    print $i**3;
    print " ";
  }
  print "\n";
}
