my $n=20;
sub fac {
  my ($n) = @_;
  if ($n < 2) {
    return $n;
  }
  else {
    return $n * fac($n-1);
  }
}
print fac(2*$n)/(fac($n)*fac($n)),"\n";
