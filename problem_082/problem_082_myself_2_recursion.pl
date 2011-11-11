use strict;
use warnings;

open(my $in,  "<",  "matrix_5.txt")  or die "Can't open input.txt: $!";
my @matrix=();
while (<$in>) {
  my $line=$_;
  chomp($line);
  $line =~ tr/,/ /;
  my @row=split(' ',$line);
  push(@matrix,\@row);
}
close $in or die "$in: $!";
print "\n----------part 1 get matrix----------\n";
for my $i ( 0 .. $#matrix ) {
  for my $j ( 0 .. $#{$matrix[$i]} ) {
    printf("%3d ",$matrix[$i][$j]);
  }
  print "\n";
}
print "\n----------part 2----------\n";
sub matrix_min_sum {
  my $current_min=shift;
  my $current_i=shift;
  my $current_j=shift;

  if ($current_i==0 and $current_j==0) {
    return $current_min;
  }
  else {
    my ($next_min,$next_i,$next_j)=next_min($current_min,$current_i,$current_j);
    matrix_min_sum($next_min,$next_i,$next_j);
  }
  print "\n";
}
for (my $i=0;$i<=$#matrix;$i++) {
  my $min=$matrix[$i][$#matrix];
  my $j=$#matrix;
  matrix_min_sum($min,$i,$j);
}
print "\n";

  #if ($matrix[$current_i-1][$current_j], $matrix[$current_i+1][$current_j], $matrix[$current_i][$current_j-1]
