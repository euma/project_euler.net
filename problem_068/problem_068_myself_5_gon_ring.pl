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
my @all_solution=();
my @set_a1=(1 .. 10);
for my $a1 (@set_a1)
{
  my @set_a2_exclude=($a1);
  my @set_a2 = grep{ not $_ ~~ @set_a2_exclude } @set_a1;
  for my $a2 (@set_a2)
  {
    my @set_a3_exclude=($a1,$a2);
    my @set_a3 = grep{ not $_ ~~ @set_a3_exclude } @set_a2;
    for my $a3 (@set_a3)
    {
      my $sum_a1a2a3= $a1+$a2+$a3;
      my @set_a4_exclude=($a1,$a2,$a3);
      my @set_a4 = grep{ not $_ ~~ @set_a4_exclude } @set_a3;
      for my $a4 (@set_a4)
      {
	my $a5=$a3;
	my $a6_validate=$sum_a1a2a3-$a4-$a5;
        my @set_a6_exclude=($a1,$a2,$a3,$a4);
        my @set_a6 = grep{ not $_ ~~ @set_a6_exclude } @set_a4;
	if (in_array($a6_validate,\@set_a6)) {
	  my $a6=$a6_validate;
	  my @set_a7_exclude=($a1,$a2,$a3,$a4,$a6);
	  my @set_a7 = grep{ not $_ ~~ @set_a7_exclude } @set_a6;
          for my $a7 (@set_a7)
	  {
	    my $a8=$a6;
	    my $a9_validate=$sum_a1a2a3-$a7-$a8;
	    my @set_a9_exclude=($a1,$a2,$a3,$a4,$a6,$a7);
	    my @set_a9 = grep{ not $_ ~~ @set_a9_exclude } @set_a7;
	    if (in_array($a9_validate,\@set_a9)) {
	      my $a9=$a9_validate;
	      my @set_a10_exclude=($a1,$a2,$a3,$a4,$a6,$a7,$a9);
	      my @set_a10 = grep{ not $_ ~~ @set_a10_exclude } @set_a9;
	      for my $a10 (@set_a10)
	      {
		my $a11=$a9;
		my $a12_validate=$sum_a1a2a3-$a10-$a11;
		my @set_a12_exclude=($a1,$a2,$a3,$a4,$a6,$a7,$a9,$a10);
		my @set_a12 = grep{ not $_ ~~ @set_a12_exclude } @set_a10;
		if (in_array($a12_validate,\@set_a12)) {
		  my $a12=$a12_validate;
		  my $a14=$a12;
		  my $a15=$a2;
		  my $a13_validate=$sum_a1a2a3-$a14-$a15;
		  my @set_a13_exclude=($a1,$a2,$a3,$a4,$a6,$a7,$a9,$a10,$a12);
		  my @set_a13 = grep{ not $_ ~~ @set_a13_exclude } @set_a12;
		  if (in_array($a13_validate,\@set_a13)) {
		    my $a13=$a13_validate;
		    my $solution= "$a1,$a2,$a3;$a4,$a5,$a6;$a7,$a8,$a9;$a10,$a11,$a12;$a13,$a14,$a15";
		    print "$solution\n";
		    print "$a1+$a2+$a3="; print $a1+$a2+$a3; print "\n";
		    print "$a4+$a5+$a6="; print $a4+$a5+$a6; print "\n";
		    print "$a7+$a8+$a9="; print $a7+$a8+$a9; print "\n";
		    print "$a10+$a11+$a12="; print $a10+$a11+$a12; print "\n";
		    print "$a13+$a14+$a15="; print $a13+$a14+$a15; print "\n";
		    push(@all_solution,$solution);
		  }
		}
	      }
	    }
	  }
	}
      }
    }
  }
}
#my %seen=();
#my $max_num=-1;
#for (my $i=0;$i<=$#all_solution;$i++)
#{
#  if (not $seen{$i}) {
#    my @split_solution_i=split(";",$all_solution[$i]);
#    my @split_i_element=split(",",$split_solution_i[0]);
#    my $sum_i=0;
#    foreach (@split_i_element)
#    {
#      $sum_i += $_;
#    }
#    print "$sum_i: ";
#    print $all_solution[$i];
#    print "\n";
#    my $num_str="";
#    foreach (@split_solution_i){
#      my @split_elem=split(",",$_);
#      foreach (@split_elem) {
#	$num_str=$num_str.$_;
#      }
#    }
#    print "$num_str\n";
#    if ($num_str > $max_num) { $max_num = $num_str; }
#    for (my $k=$i+1;$k<=$#all_solution;$k++)
#    {
#      my @split_solution_k=split(";",$all_solution[$k]);
#      my @split_k_element=split(",",$split_solution_k[0]);
#      my $sum_k=0;
#      foreach (@split_k_element)
#      {
#	$sum_k += $_;
#      }
#      if ($sum_i == $sum_k) {
#	my $continue=1;
#	for (my $n=0;$n<=$#split_solution_i;$n++) {
#	  my $not_find=0;
#	  for (my $m=0;$m<=$#split_solution_k;$m++) {
#	    if ("$split_solution_i[$n]" eq "$split_solution_k[$m]") {
#	      $split_solution_k[$m]=-1;
#	      last;
#	    }
#	    else { $not_find++; }
#	  }
#	  if ($not_find == $#split_solution_k+1) { $continue=0;last; }
#	}
#	if ($continue) {
#	  my $is_print=1;
#	  for (my $m=0;$m<=$#split_solution_k;$m++) {
#	    if ("$split_solution_k[$m]" ne "-1") {
#	      $is_print=0;
#	      last;
#	    }
#	  }
#	  if ($is_print) {
#	    $seen{$k}=1;
##	    print "  $sum_k: ";
##	    print $all_solution[$k];
##	    print "\n";
#	  }
#	}
#      }
#    }
#  }
#}
#print "\n$max_num\n";
