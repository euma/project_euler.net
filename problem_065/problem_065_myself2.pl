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
sub h {
  my $n=shift;
  if ($n == -1) {
    return 1;
  }
  elsif ($n == -2) {
    return 0;
  }
  else
  {
    return h($n-2)+$e_int_arr[$n]*h($n-1);
  }
}
my $num= h($#e_int_arr);
my $sum_digit=0;
my @num_split=split("",$num);
for (my $i=0;$i<=$#num_split;$i++)
{
  $sum_digit+=$num_split[$i];
}
print "\n$num\n";
print "\n$sum_digit\n";
