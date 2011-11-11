use strict;
use warnings;

#my $max=$ARGV[0];
my $num=$ARGV[0];
my $limit=$ARGV[1];
for (my $max=1;$max<=$limit;$max++)
{
  my $x=sqrt($num);
  #there my sqrt($num)'s Accuracy is not high
  #so when n=61 I get wrong continued fraction for sqrt(61)!
  my $a=int($x);
  my @int_arr=();
  for (my $i=0;$i<$max;$i++)
  {
    push(@int_arr, $a);
    $x=$x-$a;
    $x=1/$x;
    $a=int($x);
  }
  print "@int_arr\n";
  print $#int_arr+1;
  print "\n";
  my $fraction=$int_arr[$#int_arr];
  {
    use bigrat;
    for (my $i=$#int_arr-1;$i>=0;$i--)
    {
      $fraction=$int_arr[$i]+1/$fraction;
    }
    print "\n$fraction\n";
    my $x=0;
    my $y=0;
    if ($fraction =~ /\//) {
      my @split_fraction=split("/",$fraction);
      $x=$split_fraction[0];
      $y=$split_fraction[1];
    }
    else
    {
      #print "($fraction)\n";
      $x=$fraction;
      $y=1;
    }
    my $k=$x*$x-$num*$y*$y;
    print "= $k\n";
    if ($k == 1)
    {
      print "$x $y get 1\n";
    }
    print "\n-----------------\n";
  }
}
