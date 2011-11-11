sub fib {
  my $n=shift;
  if ($n == 1) {
    return 1;
  } elsif ($n == 2) {
    return 1;
  } else {
    return fib($n-1)+fib($n-2);
  }
}
my $i=1;
while (1) {
  my $fib_i=fib($i);
  print "$fib_i\n"; 
  if ($fib_i =~ /^\d{100}$/) { print "\n--",$fib_i,"--\n"; last; }
  #if ($fib_i =~ /^\d{3}$/) { print "\n",$fib_i,"\n"; last; }
  $i++;
}
