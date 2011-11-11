use strict;
use warnings;

open(my $in,  "<",  "matrix_5_2.txt")  or die "Can't open input.txt: $!";
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
#for (my $i=0;$i<=$#matrix;$i++) {
#  my $j=$#matrix;
#  print "$matrix[$i][$j] ";
#}
#print "\n";
my $level_sum=0;
for (my $j=$#matrix-1;$j>=0;$j--) {
  my @matrix_tmp=();
  for (my $i=0;$i<=$#matrix;$i++) {
    print "$i: ";
    print "$matrix[$i][$j]: ";
    my $i_min=$matrix[$i][$j+1];
    print "($matrix[$i][$j+1], ";
    #up find
    print "\n  up find\n";
    my $up=$i;
    for (my $k=1;$k<=$up;$k++) {
      $level_sum=0;
      my $h=1;
      while ($h<=$k) {
        #print "$matrix[$i-$h][$j]+";
        if (defined($matrix_tmp[$i-$h][$j])) {
          print "$matrix_tmp[$i-$h][$j]+";
          $level_sum +=$matrix_tmp[$i-$h][$j];
        }
        else {
          print "$matrix[$i-$h][$j]+";
          $level_sum +=$matrix[$i-$h][$j];
        }

        $h++;
      }
      print "$matrix[$i-$h+1][$j+1],";
      $level_sum +=$matrix[$i-$h+1][$j+1];
      #print "=$level_sum, ";
      if ($level_sum<$i_min) { $i_min=$level_sum; }
    }
    #down find
    print "\n  down find\n";
    my $down=$#matrix-$i;
    for (my $k=1;$k<=$down;$k++) {
      my $h=1;
      $level_sum=0;
      while ($h<=$k) {
        #print "$matrix[$i+$h][$j]+";
        if (defined($matrix_tmp[$i+$h][$j])) {
          print "$matrix_tmp[$i+$h][$j]+";
          $level_sum +=$matrix_tmp[$i+$h][$j];
        }
        else {
          print "$matrix[$i+$h][$j]+";
          $level_sum +=$matrix[$i+$h][$j];
        }
        $h++;
      }
      print "$matrix[$i+$h-1][$j+1],";
      $level_sum +=$matrix[$i+$h-1][$j+1];
      #print "=$level_sum, ";
      if ($level_sum<$i_min) { $i_min=$level_sum; }
    }
    print ")";
    print "($i_min)\n";
    $matrix_tmp[$i][$j]=$matrix[$i][$j];
    $matrix[$i][$j]=$matrix[$i][$j]+$i_min;
    print "($i,$j,$matrix[$i][$j])\n";
  }
  print "\n";
}
print "\n";
my $all_path_min=$matrix[0][0];
print "$matrix[0][0] ";
for (my $i=1;$i<=$#matrix;$i++) {
  my $j=0;
  print "$matrix[$i][$j] ";
  my $one_path_min=$matrix[$i][$j];
  if ($all_path_min>$one_path_min) { $all_path_min=$one_path_min; }
}
print "\n$all_path_min\n";
