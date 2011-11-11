use strict;
use warnings;

sub in_array {
  my $element=shift;
  my $arr_ref=shift;
  for (my $i=0;$i<=$#{$arr_ref};$i++) {
    if ($element == $arr_ref->[$i]) {
      return 1;
    }
  }
  return 0;
}
my @set_a1=(1 .. 6);
for my $a1 (@set_a1)
{
  my @set_a2_exclude=($a1);
  my @set_a2 = grep{ not $_ ~~ @set_a2_exclude } @set_a1;
  #print "(@set_j)\n";
  for my $a2 (@set_a2)
  {
    my @set_a3_exclude=($a1,$a2);
    my @set_a3 = grep{ not $_ ~~ @set_a3_exclude } @set_a2;
    #print "(@set_a3)\n";
    for my $a3 (@set_a3)
    {
      #print "$a1 + $a2 + $a3 = ";
      my $sum_a1a2a3= $a1+$a2+$a3;
      my @set_a4_exclude=($a1,$a2,$a3);
      my @set_a4 = grep{ not $_ ~~ @set_a4_exclude } @set_a3;
      for my $a4 (@set_a4)
      {
	#print "\n";
	#print "$a1 $a2 $a3 $a4\n";
	my $a5=$a3;
	my $a6_validate=$sum_a1a2a3-$a4-$a5;
        my @set_a6_exclude=($a1,$a2,$a3,$a4);
        my @set_a6 = grep{ not $_ ~~ @set_a6_exclude } @set_a4;
	if (in_array($a6_validate,\@set_a6)) {
	  my $a6=$a6_validate;
	  my $a8=$a6;
	  my $a9=$a2;
	  my $a7_validate=$sum_a1a2a3-$a8-$a9;
	  my @set_a7_exclude=($a1,$a2,$a3,$a4,$a6);
	  my @set_a7 = grep{ not $_ ~~ @set_a7_exclude } @set_a6;
	  if (in_array($a7_validate,\@set_a7)) {
	    my $a7=$a7_validate;
	    print "$a1,$a2,$a3;$a4,$a5,$a6;$a7,$a8,$a9;\n";
	    print "$a1 + $a2 + $a3 = ";
	    print $a1 + $a2 + $a3;print "\n";
	    print "$a4 + $a5 + $a6 = ";
	    print $a4 + $a5 + $a6;print "\n";
	    print "$a7 + $a8 + $a9 = ";
	    print $a7 + $a8 + $a9;print "\n";
	    print "-------------------------\n";
	  }
	}
      }
    }
  }
}
