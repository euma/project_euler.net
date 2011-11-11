use strict;
use warnings;

open(my $in,  "<",  "matrix_3.txt")  or die "Can't open input.txt: $!";
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
  my $j=$#matrix;
  print "$matrix[$i][$j] ";
}
print "\n";
for (my $i=0;$i<=$#matrix;$i++) {
  my $j=$#matrix-1;
  if ($i==0) {
#    print "$matrix[$i][$j]: ";
#    print "($matrix[$i][$j+1],";
#
#    print "$matrix[$i+1][$j]+";
#    print "$matrix[$i+1][$j+1],";
#
#    print "$matrix[$i+1][$j]+";
#    print "$matrix[$i+2][$j]+";
#    print "$matrix[$i+2][$j+1])\n";
    print "$matrix[$i][$j]: ";
    print "($matrix[$i][$j+1],";

    for (my $k=1;$k<=$#matrix;$k++) {
      my $h=1;
      while ($h<=$k) {
        print "$matrix[$i+$h][$j]+";
        $h++;
      }
      print "$matrix[$i+$h-1][$j+1],";
    }
    print ")\n";
  }
  elsif ($i==$#matrix) {
#    print "$matrix[$i][$j]: ";
#    print "($matrix[$i][$j+1],";
#
#    print "$matrix[$i-1][$j]+";
#    print "$matrix[$i-1][$j+1],";
#
#    print "$matrix[$i-1][$j]+";
#    print "$matrix[$i-2][$j]+";
#    print "$matrix[$i-2][$j+1])\n";

    print "$matrix[$i][$j]: ";
    print "($matrix[$i][$j+1],";

    for (my $k=1;$k<=$#matrix;$k++) {
      my $h=1;
      while ($h<=$k) {
        print "$matrix[$i-$h][$j]+";
        $h++;
      }
      print "$matrix[$i-$h+1][$j+1],";
    }
    print ")\n";
  }
  else {
    print "$matrix[$i][$j]: ";
    print "($matrix[$i][$j+1],";

    print "$matrix[$i-1][$j]+";
    print "$matrix[$i-1][$j+1],";

    print "$matrix[$i+1][$j]+";
    print "$matrix[$i+1][$j+1])\n";

  }
}
print "\n";
