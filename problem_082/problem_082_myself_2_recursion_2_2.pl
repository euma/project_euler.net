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
sub next_min {
  my ($current_min,$current_i,$current_j)=@_;
  my $i1=$current_i-1;
  my $j1=$current_j;
  my $i2=$current_i+1;
  my $j2=$current_j;
  my $i3=$current_i;
  my $j3=$current_j-1;
#for most situation is ok!
  if (($matrix[$i1][$j1] < $matrix[$i2][$j2]) and ($matrix[$i1][$j1] < $matrix[$i3][$j3])) {
    return ($matrix[$i1][$j1]+$current_min, $i1, $j1);
  }
  if (($matrix[$i2][$j2] < $matrix[$i1][$j1]) and ($matrix[$i2][$j2] < $matrix[$i3][$j3])) {
    return ($matrix[$i2][$j2]+$current_min, $i2, $j2);
  }
  if (($matrix[$i3][$j3] < $matrix[$i1][$j1]) and ($matrix[$i3][$j3] < $matrix[$i2][$j2])) {
    return ($matrix[$i3][$j3]+$current_min, $i3, $j3);
  }
#there must consider special situation
}
my ($current_min,$current_i,$current_j)=(15,2,4);
print "($current_min,$current_i,$current_j)\n";
my ($next_min,$next_i,$next_j)=next_min($current_min,$current_i,$current_j);
print "($next_min,$next_i,$next_j)\n";
#print "\n----------part 3----------\n";
#sub matrix_min_sum {
#  my $current_min=shift;
#  my $current_i=shift;
#  my $current_j=shift;
#
#  if ($current_i==0 and $current_j==0) {
#    return $current_min;
#  }
#  else {
#    my ($next_min,$next_i,$next_j)=next_min($current_min,$current_i,$current_j);
#    matrix_min_sum($next_min,$next_i,$next_j);
#  }
#  print "\n";
#}
#for (my $i=0;$i<=$#matrix;$i++) {
#  my $min=$matrix[$i][$#matrix];
#  my $j=$#matrix;
#  matrix_min_sum($min,$i,$j);
#}
