use strict;
use warnings;
use Math::BigFloat;

my $largest=$ARGV[0];
my $max=$ARGV[1];
for (my $num=2;$num<=$largest;$num++) {
  my $num_sqrt=sqrt($num);
  if ($num_sqrt != int($num_sqrt)) {
    print "$num: ";
    my $x = Math::BigFloat->new($num);
    $x->bsqrt();
    my $a=$x->as_int();
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

    my $h1=0; my $h2=1;
    my $k1=1; my $k2=0;
    for (my $i=0;$i<=$#int_arr;$i++) {
      my $h1_tmp=$h1;
      $h1=$h2;
      $h2=$int_arr[$i]*$h2+$h1_tmp;

      my $k1_tmp=$k1;
      $k1=$k2;
      $k2=$int_arr[$i]*$k2+$k1_tmp;

      my $bh2 = Math::BigFloat->new($h2);
      my $bk2 = Math::BigFloat->new($k2);
      my $bnum = Math::BigFloat->new($num);
      $bh2->bmul($bh2);
      $bk2->bmul($bk2);
      $bk2->bmul($bnum);
      my $k = $bh2->copy();
      $k->bsub($bk2);
      #print "big k: $k\n";
      if ($k == 1) {
	print "$h2 $k2 get 1\n";
	last;
      }
    }
  }
}
