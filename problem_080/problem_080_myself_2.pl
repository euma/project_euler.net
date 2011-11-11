use strict;
use warnings;
use Math::BigFloat;

my $target=100;
my $total_sum=0;
for (my $i=2;$i<=$target;$i++) {
  if (sqrt($i) != int(sqrt($i))) {
    my $x = Math::BigFloat->new("$i");
    $x->accuracy(110);
    my $strx=$x->bsqrt();
    print "$strx\n";
    my @split_strx=split('',$strx);
    my $digit_sum=0;
    my $digit=100;
    for (my $i=0;$i<$digit;$i++) {
      if ($split_strx[$i] ne '.') {
        $digit_sum += $split_strx[$i];
      } else { $digit++; }
    }
    print "\n$digit_sum\n";
    $total_sum += $digit_sum;
  }
}
print "\n$total_sum\n";
