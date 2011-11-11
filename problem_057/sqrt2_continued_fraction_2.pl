use strict;
use warnings;

my $limit=$ARGV[0];
my $sum=0;
for (my $max=1;$max<=$limit;$max++) {
  my @int_arr=();
  $int_arr[0]=1;
  for (my $i=0;$i<$max;$i++) {
    push(@int_arr,2);
  }
  #print "\n@int_arr\n";
  my $fac=$int_arr[$#int_arr];
  {
    use bigrat;
    for (my $i=$#int_arr-1;$i>=0;$i--)
    {
      #print "$fac\n";
      $fac=$int_arr[$i]+1/$fac;
    }
    my @split_fac=split("/",$fac);
    #print "(@split_fac)";
    if ($#split_fac != 0 and length($split_fac[0])>length($split_fac[1]))
    {
      print "$max: $fac(n>d)\n";
      $sum++;
    }
  }
}
print "\n$sum\n";
