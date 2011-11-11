use strict;
use warnings;

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
