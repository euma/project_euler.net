use strict;
use warnings;
use Math::BigFloat;
Math::BigFloat->accuracy(100);#there improve the accuracy to get correct continued fraction number!
my $largest=$ARGV[0];
my $max=$ARGV[1];
for (my $num=2;$num<=$largest;$num++) {
  my $x = Math::BigFloat->new($num);
  $x->bsqrt();
  my $x_copy=$x->copy();
  $x_copy=$x_copy->bfloor();
  my $x_compare=$x->bcmp($x_copy);
  if ($x_compare == 1) {
    print "$num: ";
    my $get=0;
    my $h1=0; my $h2=1;
    my $k1=1; my $k2=0;
    for (my $i=0;$i<=$max;$i++)
    {
      my $a=$x->as_int();
      my $h1_tmp=$h1;
      $h1=$h2;
      $h2=$a*$h2+$h1_tmp;

      my $k1_tmp=$k1;
      $k1=$k2;
      $k2=$a*$k2+$k1_tmp;

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
	$get=1;
	last;
      }
      my $y = Math::BigFloat->new($a);
      $x->bsub($y);
      my $one = Math::BigFloat->bone();
      $x=$one->bdiv($x);
    }
    if (not $get) {
      print "$num is not get!\n";
      exit 1;
    }
  }
}
