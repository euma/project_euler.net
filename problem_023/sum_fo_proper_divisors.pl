use strict;
use warnings;
#use POSIX;
sub sum_of_proper_divisors {
  my $n=shift;
  my $sum=0;
  if ($n == 1) { return 0; }
  else {
    my $limit=int(sqrt($n));
    print "($limit)";
    #first take into account the case that n is a perfect square.
    if ($limit*$limit == $n) {
      $sum=1+$limit;
      $limit--;
    } else { $sum=1; }
    my $start_divisor=1;
    my $step=1;
    if ($n % 2 == 1) { $start_divisor=3; $step=2;
    } else { $start_divisor=2; $step=1; }
    while ($start_divisor<=$limit) {
      if ($n % $start_divisor == 0) {
        print "($start_divisor,",$n/$start_divisor,")";
        $sum += ($start_divisor+$n/$start_divisor);
      }
      $start_divisor += $step;
    }
    print "\n----------------------------\n";
  }
  return $sum;
}
for (my $i=1;$i<10;$i++) {
  print "\n################################\n";
  print "$i:",sum_of_proper_divisors($i),"\n";
}
