use strict;
use warnings;

open(my $in,  "<",  "matrix_2.txt")  or die "Can't open input.txt: $!";
my @matrix_small=();
while (<$in>) {
  my $line=$_;
  chomp($line);
  #print "$line\n";
  #my @row=split(",",$_);
  $line =~ tr/,/ /;
  #print "$line\n";
  my @row=split(' ',$line);
  #my @row=split(",",$line);
  push(@matrix_small,\@row);
  #push @matrix_small,[@row];
}
close $in or die "$in: $!";
for my $i ( 0 .. $#matrix_small ) {
  for my $j ( 0 .. $#{$matrix_small[$i]} ) {
    #print "elt $i $j is $matrix_small[$i][$j]";
    #print "$matrix_small[$i][$j] ";
    printf("%2d ",$matrix_small[$i][$j]);
  }
  print "\n";
}
#my @top_left=();
#for (my $i=0;$i<=$#matrix_small;$i++) {
#  my @row=();
#  for (my $j=0;$j<=$i;$j++) {
#    push(@row,$matrix_small[$i-$j][$j]);
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
my @top_left2=();
#for (my $i=0;$i<=$#matrix_small;$i++) {
my $triangle_size=2*$#matrix_small+1;
for (my $i=0;$i<$triangle_size;$i++) {
  my @row=();
  for (my $j=0;$j<=$i;$j++) {
    #push(@row,$matrix_small[$i-$j][$j]);
    my $m=$i-$j;
    my $n=$j;
    if ($m>$#matrix_small) { $m=$#matrix_small; $n=$i-$#matrix_small; }
    if ($n>$#matrix_small) { $n=$#matrix_small; $m=$i-$#matrix_small; }
    push(@row,$matrix_small[$m][$n]);
    #print "$matrix_small[$m][$n] ";
  }
  push @top_left2,[@row];
  #print "\n";
}
for my $i ( 0 .. $#top_left2 ) {
  for my $j ( 0 .. $#{$top_left2[$i]} ) {
    #print "elt $i $j is $top_left2[$i][$j]";
    print "$top_left2[$i][$j] ";
  }
  print "\n";
}
print "\n";
