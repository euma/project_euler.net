use strict;
use warnings;
sub min {
  my $a=shift;
  my $b=shift;
  if ($a > $b) { return $b; }
  else { return $a; }
}
my @dir=([1, 0], [-1, 0], [0, 1], [0, -1]);
#[1, 0] right #[-1, 0] left #[0, 1] up #[0, -1] down
open(my $in,  "<",  "matrix_5.txt")  or die "Can't open input.txt: $!";
my @a=();
my @dp=();
my $i=0;
while (<$in>) {
  my $line=$_;
  chomp($line);
  $line =~ tr/,/ /;
  my @row=split(' ',$line);
  for (my $j = 0; $j <= $#row; $j++) {
    $a[$i][$j]=$row[$j];
    if ($j == 0 && $i == 0) {
      $dp[$i][$j] = $a[$i][$j];
    } else {
      $dp[$i][$j] = 26032400;
    }
  }
  $i++;
}
close $in or die "$in: $!";
my $n=$i;


for (my $z = 0; $z < $n; $z++) {
  for (my $j = 0; $j < $n; $j++) {
    for (my $i = 0; $i < $n; $i++) {
      for (my $k = 0; $k < 4; $k++) {
        if ($i + $dir[$k][0] >= 0 && $j + $dir[$k][1] < $n && $i + $dir[$k][0] < $n && $j + $dir[$k][1] >= 0) {
          $dp[$i + $dir[$k][0]][$j + $dir[$k][1]] = min($dp[$i][$j] + $a[$i + $dir[$k][0]][$j + $dir[$k][1]], $dp[$i + $dir[$k][0]][$j +$dir[$k][1]]);
        }
      }
    }
  }
  print "$z----------------\n";
  for (my $i = 0; $i < $n; $i++) {
    for (my $j = 0; $j < $n; $j++) {
      print "$dp[$i][$j] ";
    }
    print "\n";
  }
}
printf("%d\n", $dp[$n - 1][$n - 1]);
