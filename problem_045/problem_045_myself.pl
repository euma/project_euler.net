use strict;
use warnings;

sub is_triangle {
  my $n=shift;
  my $test=sqrt(1+8*$n)-1;
  if ($test/2 == int($test/2)) {
    return 1;
  } else {
    return 0;
  }
}
sub is_pentagonal {
  my $n=shift;
  my $test=sqrt(1+24*$n)+1;
  if ($test/6 == int($test/6)) {
    return 1;
  } else {
    return 0;
  }
}
sub is_hexagonal {
  my $n=shift;
  my $test=sqrt(1+8*$n)+1;
  if ($test/4 == int($test/4)) {
    return 1;
  } else {
    return 0;
  }
}

my $max=$ARGV[0];
for (my $i=1;$i<=$max;$i++) {
  if (is_triangle($i) and is_pentagonal($i) and is_hexagonal($i)) {
    print "$i\n";
  }
}
