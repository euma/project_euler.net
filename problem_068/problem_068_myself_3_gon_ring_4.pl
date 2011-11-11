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
	    my $solution= "$a1,$a2,$a3;$a4,$a5,$a6;$a7,$a8,$a9";
	    push(@all_solution,$solution);
	  }
	}
      }
    }
  }
}
my %seen=();
my $max_num=-1;
for (my $i=0;$i<=$#all_solution;$i++)
{
  if (not $seen{$i}) {
    my @split_solution_i=split(";",$all_solution[$i]);
    my @split_i_element=split(",",$split_solution_i[0]);
    my $sum_i=0;
    foreach (@split_i_element)
    {
      $sum_i += $_;
    }
    print "$sum_i: ";
    print $all_solution[$i];
    print "\n";
    my $num_str="";
    foreach (@split_solution_i){
      my @split_elem=split(",",$_);
      foreach (@split_elem) {
	$num_str=$num_str.$_;
      }
    }
    print "$num_str\n";
    if ($num_str > $max_num) { $max_num = $num_str; }
    for (my $k=$i+1;$k<=$#all_solution;$k++)
    {
      my @split_solution_k=split(";",$all_solution[$k]);
      my @split_k_element=split(",",$split_solution_k[0]);
      my $sum_k=0;
      foreach (@split_k_element)
      {
	$sum_k += $_;
      }
      if ($sum_i == $sum_k) {
	my $continue=1;
	for (my $n=0;$n<=$#split_solution_i;$n++) {
	  my $not_find=0;
	  for (my $m=0;$m<=$#split_solution_k;$m++) {
	    if ("$split_solution_i[$n]" eq "$split_solution_k[$m]") {
	      $split_solution_k[$m]=-1;
	      last;
	    }
	    else { $not_find++; }
	  }
	  if ($not_find == $#split_solution_k+1) { $continue=0;last; }
	}
	if ($continue) {
	  my $is_print=1;
	  for (my $m=0;$m<=$#split_solution_k;$m++) {
	    if ("$split_solution_k[$m]" ne "-1") {
	      $is_print=0;
	      last;
	    }
	  }
	  if ($is_print) {
	    $seen{$k}=1;
#	    print "  $sum_k: ";
#	    print $all_solution[$k];
#	    print "\n";
	  }
	}
      }
    }
  }
}
print "\n$max_num\n";
