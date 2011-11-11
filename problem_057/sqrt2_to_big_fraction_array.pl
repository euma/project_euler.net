use strict;
use warnings;

#my $max=$ARGV[0];
my $limit=$ARGV[0];
for (my $max=1;$max<=$limit;$max++)
{
  my $x=sqrt(2);
  my $a=int($x);
  my @int_arr=();
  for (my $i=0;$i<$max;$i++)
  {
    #print "$a\n";
    push(@int_arr, $a);
    #print "$x\n";
    $x=$x-$a;
    $x=1/$x;
    $a=int($x);
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
    if ($#split_fac == 0)
    {
      print "$fac\n";
    }
    else
    {
      if (length($split_fac[0])>length($split_fac[1]))
      {
	print "$fac(n>d)\n";
      }
      else
      {
	print "$fac(n<=d)\n";
      }
    }
  }
}
print "\n";
