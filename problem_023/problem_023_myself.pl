use strict;
use warnings;
#sub sum_divisor {
#  my $n=shift;
#  my $sum=0;
#  if ($n>1) {
#    for (my $i=2;$i<$n;$i++) {
#      if ($n % $i == 0) {
#        $sum += $i;
#      }
#    }
#    return $sum+1;
#  } else {
#    return 0;
#  }
#}#not good!
#sub sum_divisor {
#  my $n=shift;
#  my $sum=0;
#  if ($n == 1) { return 0; }
#  else {
#    my $limit=int(sqrt($n));
#    if ($limit*$limit == $n) {
#      $sum=1+$limit;
#      $limit--;
#    } else { $sum=1; }
#    my $start_divisor=1; 
#    my $step=1;
#    if ($n % 2 == 1) { $start_divisor=3; $step=2; }
#    else { $start_divisor=2; $step=1; }
#    while ($start_divisor<=$limit) {
#      if ($n % $start_divisor == 0) {
#        $sum += ($start_divisor+$n/$start_divisor);
#      }     
#      $start_divisor += $step;
#    }     
#  }
#  return $sum;
#}#can improve
sub sum_divisor {
my $n=shift;
  my $tmp_n=$n;
  my $sum=1;
  my $prime=2;
  while (($prime*$prime<=$n) and $n>1) {
    if ($n % $prime == 0) {
      my $j=$prime*$prime;
      $n /= $prime;
      while ($n % $prime == 0) {
        $j *= $prime;
        $n /= $prime;
      }
      $sum *= ($j-1);
      $sum /= ($prime-1);
    }
    if ($prime == 2) { $prime=3 } else { $prime += 2; }
  }
  if ($n>1) { $sum *= ($n+1); }#there $n is prime!
  return $sum-$tmp_n;
}

sub is_abundant {
  my $n=shift;
  if ($n>1) {
    if (sum_divisor($n)>$n) {
      return 1;
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}
my $limit=28123;
#my $limit=50;
my @abundant_list=();
for(my $i=2;$i<=$limit;$i++) {
  if (is_abundant($i)) {
    push(@abundant_list,$i);
  }
}
#print join(" -- ",@abundant_list);
#print "\n----------------------\n";

my @two_abundant_sum_list=();
for(my $i=0;$i<=$#abundant_list;$i++) {
  for(my $j=$i;$abundant_list[$i]+$abundant_list[$j]<=$limit;$j++) {
    #print " -- ($abundant_list[$i],$abundant_list[$j])";
    my $tmp_sum=$abundant_list[$i]+$abundant_list[$j];
    push(@two_abundant_sum_list,$tmp_sum);
  }
}
#print "\n----------------------\n";
#
sub unique_array {
    my %seen = ();
    my @r = ();
    foreach my $a (@_) {
        unless ($seen{$a}) {
            push @r, $a;
            $seen{$a} = 1;
        }
    }
    return @r;
}
#print join(" -- ",@two_abundant_sum_list);
#print "\n----------------------\n";
#print join(" -- ",unique_array(@two_abundant_sum_list));
@two_abundant_sum_list=unique_array(@two_abundant_sum_list);
my $sum1=0;
foreach (@two_abundant_sum_list) {
  $sum1 += $_;
}
#print "\n----------------------\n";
my $sum2=$limit*($limit+1);
$sum2 /= 2;
print $sum2-$sum1;
print "\n";
