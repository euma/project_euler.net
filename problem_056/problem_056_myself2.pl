use strict;
use warnings;
use bignum;

#real	0m57.489s
#user	0m50.127s
#sys	0m0.084s

sub sum_digit {
  my $num=shift;
  my @split_num=split("",$num);
  my $sum=0;
  for (my $i=0;$i<=$#split_num;$i++) {
    $sum += $split_num[$i];
  }
  return $sum;
}

#print "test sum_digit subroutine begin\n";
#print sum_digit(1234567890);
#print "\ntest sum_digit subroutine end\n";
my $limit=$ARGV[0];
my $max=0;
for (my $a=2;$a<$limit;$a++) {
  for (my $b=2;$b<$limit;$b++) {
    #print "$a**$b = ";
    print "$a\n";
    #print $a**$b," ";
    my $ab_Dsum=sum_digit($a**$b);
    #print "$ab_Dsum\n";
    if ($ab_Dsum > $max) {
      $max=$ab_Dsum;
    }
  }
}
print "\n##############\n";
print $max;
print "\n##############\n";
