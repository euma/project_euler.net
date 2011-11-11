use strict;
use warnings;

print sqrt(2);
print "\n";

use Math::BigFloat;
my $x = Math::BigFloat->new('2');
$x->accuracy(110);
my $strx=$x->bsqrt();
print "$strx\n";
my @split_strx=split('',$strx);
print "$split_strx[0]\n";
print "$split_strx[1]\n";
print "$split_strx[2]\n";
print "$split_strx[3]\n";
my $digit_sum=0;
my $digit=100;
for (my $i=0;$i<$digit;$i++) {
  if ($split_strx[$i] ne '.') {
    $digit_sum += $split_strx[$i];
  } else { $digit++; }
}
print "\n$digit_sum\n";
