use strict;
use warnings;

sub is_permutation_pair {
  my $m=shift;
  my $n=shift;
  #there I Make all test number have same digit! so there don't need to chech length is equal!
  #if (length($m) != length($n)) { return 0; }
  my @split_m=split("",$m);
  my @split_n=split("",$n);
  my %hash_m=();
  my %hash_n=();
  for (my $i=0;$i<=$#split_m;$i++) {
    $hash_m{$split_m[$i]}=$i;
  }
  for (my $i=0;$i<=$#split_n;$i++) {
    $hash_n{$split_n[$i]}=$i;
  }
  for my $km (keys %hash_m)
  {
    my $not_match=0;
    for my $kn (keys %hash_n)
    {
      if ($km == $kn) {
        delete $hash_n{$kn};
        last;
      } else {
        $not_match++;
      }
    }
    my $hash_n_size = scalar(keys %hash_n);
    if ($not_match == $hash_n_size) {
      return 0;
    }
  }
  if (%hash_n) { return 0; }
  else {return 1;}
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
