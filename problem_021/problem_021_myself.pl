sub sum_divisor {
  my $n=shift;
  my $sum=0;
  if ($n>1) {
    for (my $i=2;$i<$n;$i++) {
      if ($n % $i == 0) {
        $sum += $i;
      }
    }
    return $sum+1;
  } else {
    return 0;
  }
}
my $m=10000;
my $sum=0;
for (my $i=0;$i<$m;$i++) {
  #if ($i == sum_divisor(sum_divisor($i))) {
  my $i_sum_divisor=sum_divisor($i);
  if ($i == sum_divisor($i_sum_divisor) && $i !=$i_sum_divisor ) {
    print "$i:",sum_divisor($i),"\n";
    $sum += $i;
  }
}
print "\n$sum\n";
