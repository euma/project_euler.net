use strict;
use warnings;

my $largest=$ARGV[0];
my $limit=$ARGV[1];
my $largest_x1=-1;
my $D=0;
for (my $num=2;$num<=$largest;$num++)
{
  my $num_sqrt=sqrt($num);
  if ($num_sqrt != int($num_sqrt))
  {
    print "$num: ";
    my $not_find=0;
    for (my $max=1;$max<=$limit;$max++)
    {
      my $x=sqrt($num);
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
      my $fraction=$int_arr[$#int_arr];
      my $x1=0;
      my $y1=0;
      {
	use bigrat;
	for (my $i=$#int_arr-1;$i>=0;$i--)
	{
	  #print "$fraction\n";
	  $fraction=$int_arr[$i]+1/$fraction;
	}
	#print "\n$fraction\n";
	if ($fraction =~ /\//) {
	  #print "$fraction\n";
	  my @split_fraction=split("/",$fraction);
	  $x1=$split_fraction[0];
	  $y1=$split_fraction[1];
	  #print "$x1 $y\n";
	}
	else
	{
	  #print "($fraction)\n";
	  $x1=$fraction;
	  $y1=1;
	  #print "$x1 $y1\n";
	}
      }
      my $k=$x1*$x1-$num*$y1*$y1;
      if ($k == 1)
      {
	if ($x1 > $largest_x1) {
	  $largest_x1=$x1;
	  $D=$num;
	}
	print "$x1 $y1 get 1\n";
	last;
      }
      else
      {
	$not_find++;
      }
    }
    if ($not_find == $limit) { print "don't find!\n"; }
  }
}
print "\n$largest_x1\n";
print "\n$D\n";
