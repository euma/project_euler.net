use strict;
use warnings;

sub is_permutation_pair {
  my $m=shift;
  my $n=shift;
  #there I Make all test number have same digit! so there don't need to chech length is equal!
  #if (length($m) != length($n)) {
  #  return 0;
  #} else {
  my @split_m=split("",$m);
  my @split_n=split("",$n);
  for (my $i=0;$i<=$#split_m;$i++) {
    my $not_match=0;
    for (my $j=0;$j<=$#split_n;$j++) {
      if ($split_m[$i] == $split_n[$j]) {
	$split_m[$i]=-1;
	$split_n[$j]=-1;
	last;
      } else {
	$not_match++;
      }
    }
    if ($not_match == $#split_n+1) {
      return 0;
    }
  }
  foreach (@split_m) {
    if ($_ != -1) {
      return 0;
    }
  }
#  foreach (@split_n) {
#    if ($_ != -1) {
#      return 0;
#    }
#  }
  return 1;
}
my $limit_down=$ARGV[0];
my $limit_up=$ARGV[1];
for (my $digit=$limit_down;$digit<=$limit_up;$digit++)
{
  print "$digit: ";
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

  my %seen=();
  for(my $i=$start_cube;$i<=$end_cube;$i++)
  {
    if (not $seen{$i})
    {
      my $cube_num=$i**3;
      my @i_perm=($cube_num);
      for(my $j=$i+1;$j<=$end_cube;$j++)
      {
	my $cube_num_j=$j**3;
	if (is_permutation_pair($cube_num,$cube_num_j))
	{
	  print "($cube_num, $cube_num_j)\n";
	  $seen{$j}=1;
	  push(@i_perm,$cube_num_j);
	}
      }
      if ($#i_perm > 0) {print "#$#i_perm: (@i_perm)\n";}
      if ($#i_perm == 4) {print "(@i_perm)\n";exit 0;}
    }
  }
  print "\n----------------\n";
}

