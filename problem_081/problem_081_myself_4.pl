use strict;
use warnings;

open(my $in,  "<",  "matrix.txt")  or die "Can't open input.txt: $!";
my @matrix=();
while (<$in>) {     # assigns each line in turn to $_
  #print "Just read in this line: $_";
  #chomp($_);
  #my @row=split(",",$_);
  my @row=split(/,/);
  #push(@matrix,\@row);
  push @matrix,[@row];
}
close $in or die "$in: $!";
for my $i ( 0 .. $#matrix ) {
  for my $j ( 0 .. $#{$matrix[$i]} ) {
    #print "elt $i $j is $matrix[$i][$j]";
    print "$matrix[$i][$j] ";
  }
  print "\n";
}
my @top_left=();
for (my $i=0;$i<=$#matrix;$i++) {
  my @row=();
  for (my $j=0;$j<=$i;$j++) {
    push(@row,$matrix[$i-$j][$j]);
  }
  push @top_left,[@row];
}
for my $i ( 0 .. $#top_left ) {
  for my $j ( 0 .. $#{$top_left[$i]} ) {
    #print "elt $i $j is $top_left[$i][$j]";
    print "$top_left[$i][$j] ";
  }
  print "\n";
}
my @bottom_right=();
for (my $i=0;$i<$#matrix;$i++) {
  my @row=();
  for (my $j=0;$j<=$i;$j++) {
    push(@row,$matrix[$#matrix-($i-$j)][$#matrix-($j)]);
  }
  push @bottom_right,[@row];
}
for my $i ( 0 .. $#bottom_right ) {
  for my $j ( 0 .. $#{$bottom_right[$i]} ) {
    print "$bottom_right[$i][$j] ";
  }
  print "\n";
}
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
print "\n------------------\n";
print triangle_max_sum(\@top_left)+triangle_max_sum(\@bottom_right);
print "\n";
