use strict;
use warnings;
use bignum;

my $limit=$ARGV[0];
my $sum=0;
for (my $max=1;$max<=$limit;$max++) {
  print "$max: ";
  my @int_arr=();
  $int_arr[0]=1;
  for (my $i=0;$i<$max;$i++) {
    push(@int_arr,2);
  }
  #print "\n@int_arr\n";
  my $frac_num=$int_arr[$#int_arr];
  my $frac_den=1;
  for (my $i=$#int_arr-1;$i>=0;$i--)
  {
    my $frac_num_tmp=$frac_num;
    $frac_num=$int_arr[$i]*$frac_num+$frac_den;
    $frac_den=$frac_num_tmp;
  }
  if (length($frac_num)>length($frac_den))
  {
    print "$frac_num/$frac_den(n>d)\n";
    $sum++;
  }
  else
  {
    print "$frac_num/$frac_den(n<=d)\n";
  }
}
print "\n$sum\n";
