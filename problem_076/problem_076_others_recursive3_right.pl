use strict;
use warnings;

#p(k, n) = 0 if k > n
#p(k, n) = 1 if k = n
#p(k, n) = p(k+1, n) + p(k, n − k) otherwise.

our @S;
sub count {
  my $k=shift;
  my $n=shift;
  if ($k > $n) {
    return 0;
  }
  elsif ($k == $n) {
    return 1;
  }
  else {
    return count($k+1, $n) + count($k ,$n-$k);
  }
}
my $target=$ARGV[0];
for (my $i=2;$i<=$target;$i++) {
  print "$i: ";
  @S=(1 .. $i-1);
  print count(1,$i)-1;
  print "\n";
}
