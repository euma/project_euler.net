use strict;
use warnings;
use bignum;

##############
#wrong answer
#274.047127257026779023674780189079025358587
##############

#real	5m1.081s
#user	0m38.906s
#sys	4m2.691s

sub sum_digit {
  my $num=shift;
  my $sum=0;
  my $len=length($num);
  for (my $i=0;$i<$len;$i++) {
    $sum += $num%10;
    $num /= 10;
  }
  return $sum;
}
#print "test sum_digit subroutine begin\n";
#print sum_digit(1234567890);
#print "\ntest sum_digit subroutine end\n";
my $limit=$ARGV[0];
my $max=0;
for (my $a=2;$a<100;$a++) {
  for (my $b=2;$b<100;$b++) {
    print "$a\n";
    my $ab_Dsum=sum_digit($a**$b);
    if ($ab_Dsum > $max) {
      $max=$ab_Dsum;
    }
  }
}
print "\n##############\n";
print $max;
print "\n##############\n";
