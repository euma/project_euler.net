use strict;
use warnings;

sub pentagonal {
  my $n=shift;
  return $n*(3*$n-1)/2;
}

sub generalised_pentagonal {
  my $n=shift; # 0, 1, -1, 2, -2
  if ($n < 0) { return 0; }
  if ($n%2 == 0) { return pentagonal($n/2+1); }
  else { return pentagonal(-($n/2+1)); }
}

my @pt = (1);
my $target=$ARGV[0];
for (my $n=1;$n<=$target+1;$n++) {
  my $r = 0;
  my $f = -1;
  my $i = 0;
  while (1) {
    my $k = generalised_pentagonal($i);
    if ($k > $n) { last; }
    if ($i%2==0) { $f = -$f; }
    $r += $f*$pt[$n - $k];
    $i += 1;
    push(@pt,$r);
  }
}
print "@pt\n";
