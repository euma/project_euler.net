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
for (my $i=0;$i<=$#matrix;$i++) {
  print "$matrix[$i][$#matrix] :";
  if ($i-1>=0) { print "$matrix[$i-1][$#matrix] "; }
  if ($i+1<=$#matrix) { print "$matrix[$i+1][$#matrix] "; }
  print "$matrix[$i][$#matrix-1] ";
  print "\n";
}
print "\n";
