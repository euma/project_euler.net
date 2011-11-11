use strict;
use warnings;

my @triangle=(
[3],
[7, 4],
[2, 4, 6],
[8, 5, 9, 3]
);
sub triangle_max_sum {
  my $triangle_ref=shift;
  for(my $row=$#{$triangle_ref};$row>=0;$row--) {
    for(my $col=0;$col<$#{$triangle_ref->[$row]};$col++) {
      if ($triangle_ref->[$row][$col] > $triangle_ref->[$row][$col+1]) {
        $triangle_ref->[$row-1][$col] += $triangle_ref->[$row][$col];
      }
      else
      {
        $triangle_ref->[$row-1][$col] += $triangle_ref->[$row][$col+1];
      }
    }
  }
  return $triangle_ref->[0][0];
}
print triangle_max_sum(\@triangle);
print "\n";
