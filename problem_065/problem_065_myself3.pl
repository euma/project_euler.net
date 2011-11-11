use strict;
use warnings;

#there problem is recursion is very deep!
my $len=$ARGV[0];
my @e_int_arr=(2);
$len--;
my $max=int($len/3);
my $i=0;
while ($i<$max)
{
  push(@e_int_arr,1);
  push(@e_int_arr,2*($i+1));
  push(@e_int_arr,1);
  $i++;
}
if ($len % 3 == 2) {
  push(@e_int_arr,1);
  push(@e_int_arr,2*($i+1));
} elsif ($len % 3 == 1) {
  push(@e_int_arr,1);
}
print "@e_int_arr\n";
my $numerator=0;
my $fract=$e_int_arr[$#e_int_arr];
{
  use bigrat;
  for (my $i=$#e_int_arr-1;$i>=0;$i--)
  {
    #print "$fract\n";
    $fract=$e_int_arr[$i]+1/$fract;
  }
  print "\n$fract\n";
  my @split_fract=split("/",$fract);
  $numerator=$split_fract[0];
  #print "$split_fract[1]\n";
}
my $sum_digit=0;
my @num_split=split("",$numerator);
for (my $i=0;$i<=$#num_split;$i++)
{
  $sum_digit+=$num_split[$i];
}
print "\n$numerator\n";
print "\n$sum_digit\n";
