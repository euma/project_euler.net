use bignum;
sub fac {
  my $n=shift;
  my $prod=1;
  for (my $i=1;$i<=$n;$i++) {
    $prod *= $i;
  }
  return $prod;
}
my $m=fac(100);
print $m,"\n";
sub sum_digit {
  my $m = shift;
  my $sum=0;
  while ( $m =~ /^(\d)(\d+)$/) {
    $sum += $1;
    print "$1 -- $2\n";
    $m = $2;
  }
  return $sum;
}
print sum_digit($m),"\n";
