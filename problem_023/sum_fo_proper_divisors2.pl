use warnings;
use strict;
sub SumOfDivisors {
  my $n=shift;
  print "\n$n\n";
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
  return $sum;
}
sub SumOfProperDivisors {
  my $n=shift;
  return SumOfDivisors($n)-$n;
}
sub SumOfProperDivisors2 {
  my $n=shift;
  my $tmp_n=$n;
  #print "\n$n\n";
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
for (my $i=1;$i<10;$i++) {
  print "$i:",SumOfProperDivisors2($i),"\n";
}
