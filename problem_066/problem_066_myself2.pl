use strict;
use warnings;
use Math::BigFloat;

my $num=$ARGV[0];
my $limit=$ARGV[1];
for (my $max=1;$max<=$limit;$max++)
{
  #my $x=sqrt($num);
  my $x = Math::BigFloat->new($num);
  print "big x: $x\n";
  $x->bsqrt();
  print "big sqrt x: $x\n";
  #print "big: "; print $x->bstr(); print "\n";
  #there my sqrt($num)'s Accuracy is not high
  #so when n=61 I get wrong continued fraction for sqrt(61)!
  #my $a=int($x);
  my $a=$x->as_int();
  print "big a: $a\n";
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
    #there when n=61,$x $y is ten digit number, $x*$x is 20 digit number
    print "$x $y\n";
    #my $k=$x*$x-$num*$y*$y;
    my $bx = Math::BigFloat->new($x);
    my $by = Math::BigFloat->new($y);
    my $bnum = Math::BigFloat->new($num);
    $bx->bmul($bx);
    $by->bmul($by);
    $by->bmul($bnum);
    my $k = $bx->copy();
    $k->bsub($by);
    print "big k: $k\n";
    if ($k == 1)
    {
      print "$x $y get 1\n";
      exit 0;
    }
    print "\n-----------------\n";
  }
}
