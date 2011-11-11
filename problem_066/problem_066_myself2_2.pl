use strict;
use warnings;
use Math::BigFloat;

my $largest=$ARGV[0];
my $limit=$ARGV[1];
for (my $num=2;$num<=$largest;$num++) {
  my $num_sqrt=sqrt($num);
  if ($num_sqrt != int($num_sqrt)) {
    print "$num: ";
    my $get=0;
    for (my $max=1;$max<=$limit;$max++)
    {
      #my $x=sqrt($num);
      my $x = Math::BigFloat->new($num);
      #print "big x: $x\n";
      $x->bsqrt();
      #print "big sqrt x: $x\n";
      #print "big: "; print $x->bstr(); print "\n";
      #there my sqrt($num)'s Accuracy is not high
      #so when n=61 I get wrong continued fraction for sqrt(61)!
      #my $a=int($x);
      my $a=$x->as_int();
      #print "big a: $a\n";
      my @int_arr=();
      for (my $i=0;$i<$max;$i++)
      {
	push(@int_arr, $a);
	#$x=$x-$a;
	my $y = Math::BigFloat->new($a);
	$x->bsub($y);
	#print "big sub x: $x\n";
	#$x=1/$x;
	my $one = Math::BigFloat->bone();	# create a +1
	$x=$one->bdiv($x);
	#$a=int($x);
	$a=$x->as_int();
      }
      #print "@int_arr\n";
      #print $#int_arr+1;
      #print "\n";

      my $x1=0;
      my $y1=0;
      my $fraction=$int_arr[$#int_arr];
      {
	use bigrat;
	for (my $i=$#int_arr-1;$i>=0;$i--)
	{
	  $fraction=$int_arr[$i]+1/$fraction;
	}
	#print "\n$fraction\n";
	if ($fraction =~ /\//) {
	  my @split_fraction=split("/",$fraction);
	  $x1=$split_fraction[0];
	  $y1=$split_fraction[1];
	}
	else
	{
	  #print "($fraction)\n";
	  $x1=$fraction;
	  $y1=1;
	}
	#there when n=61,$x1 $y1 is ten digit number, $x1*$x1 is 20 digit number
	#print "$x1 $y1\n";
	#my $k=$x1*$x1-$num*$y1*$y1;
      }
      my $bx1 = Math::BigFloat->new($x1);
      my $by1 = Math::BigFloat->new($y1);
      my $bnum = Math::BigFloat->new($num);
      $bx1->bmul($bx1);
      $by1->bmul($by1);
      $by1->bmul($bnum);
      my $k = $bx1->copy();
      $k->bsub($by1);
      #print "big k: $k\n";
      if ($k == 1)
      {
	print "$x1 $y1 get 1\n";
	$get=1;
	#exit 0;
	last;
      }
    }
    print "\n";
    if (!$get) {
      print "$num is not get!\n";
      exit 1;
    }
  }
}
