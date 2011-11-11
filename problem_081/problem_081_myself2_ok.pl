use strict;
use warnings;

open(my $in,  "<",  "matrix.txt")  or die "Can't open input.txt: $!";
my @matrix=();
while (<$in>) {
  my $line=$_;
  chomp($line);
  #print "$line\n";
  #my @row=split(",",$_);
  $line =~ tr/,/ /;
  #print "$line\n";
  my @row=split(' ',$line);
  #my @row=split(",",$line);
  push(@matrix,\@row);
  #push @matrix,[@row];
}
close $in or die "$in: $!";
for my $i ( 0 .. $#matrix ) {
  for my $j ( 0 .. $#{$matrix[$i]} ) {
    #print "elt $i $j is $matrix[$i][$j]";
    #print "$matrix[$i][$j] ";
    printf("%2d ",$matrix[$i][$j]);
  }
  print "\n";
}
#my @top_left=();
#for (my $i=0;$i<=$#matrix;$i++) {
#  my @row=();
#  for (my $j=0;$j<=$i;$j++) {
#    push(@row,$matrix[$i-$j][$j]);
#  }
#  push @top_left,[@row];
#}
#for my $i ( 0 .. $#top_left ) {
#  for my $j ( 0 .. $#{$top_left[$i]} ) {
#    #print "elt $i $j is $top_left[$i][$j]";
#    print "$top_left[$i][$j] ";
#  }
#  print "\n";
#}
my @top_left=();
#for (my $i=0;$i<=$#matrix;$i++) {
my $triangle_size=2*$#matrix+1;
for (my $i=0;$i<$triangle_size;$i++) {
  my @row=();
  for (my $j=0;$j<=$i;$j++) {
    #push(@row,$matrix[$i-$j][$j]);
    my $m=$i-$j;
    my $n=$j;
    if ($m>$#matrix) { $m=$#matrix; $n=$i-$#matrix; }
    if ($n>$#matrix) { $n=$#matrix; $m=$i-$#matrix; }
    push(@row,$matrix[$m][$n]);
    #print "$matrix[$m][$n] ";
  }
  push @top_left,[@row];
  #print "\n";
}
for my $i ( 0 .. $#top_left ) {
  for my $j ( 0 .. $#{$top_left[$i]} ) {
    #print "elt $i $j is $top_left[$i][$j]";
    print "$top_left[$i][$j] ";
  }
  print "\n";
}
print "\n";
sub triangle_min_sum {
  my $triangle_ref=shift;
  for(my $row=$#{$triangle_ref};$row>=0;$row--) {
    for(my $col=0;$col<$#{$triangle_ref->[$row]};$col++) {
      if ($triangle_ref->[$row][$col] < $triangle_ref->[$row][$col+1]) {
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
print "\n------------------\n";
print triangle_min_sum(\@top_left);
print "\n";
