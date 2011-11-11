my @num_triangle = (
  [75],
  [95, 64],
  [17, 47, 82],
  [18, 35, 87, 10],
  [20, 4, 82, 47, 65],
  [19, 1, 23, 75, 3, 34],
  [88, 2, 77, 73, 7, 63, 67],
  [99, 65, 4, 28, 6, 16, 70, 92],
  [41, 41, 26, 56, 83, 40, 80, 70, 33],
  [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
  [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
  [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
  [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
  [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
  [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]
);

#my @num_triangle = (
#  [3],
#  [7, 4],
#  [2, 4, 6],
#  [8, 5, 9, 3],
#);
#for (my $i=0;$i<=$#num_triangle;$i++) {
#  #print $num_triangle[$i],"\n";
#  for (my $j=0;$j<=$#{$num_triangle[$i]};$j++) {
#    print $num_triangle[$i][$j]," -- ";
#  }
#  print "\n";
#}
my $i=0;
my $j=0;
my $sum=0;
while (1) {
  print $num_triangle[$i][$j],"\n";
  $sum += $num_triangle[$i][$j];
  if ($i == $#num_triangle) { last; }
  if ( $num_triangle[$i+1][$j] > $num_triangle[$i+1][$j+1]) {
    $i++;
  }
  elsif ($num_triangle[$i+1][$j] < $num_triangle[$i+1][$j+1] ) {
    $i++;
    $j++;
  }
#  else {
#    #when $num_triangle[$i+1][$j] == $num_triangle[$i+1][$j+1]
#    if ($num_triangle[$i+2][$j]> $num_triangle[$i+2][$j+1]
#        && $num_triangle[$i+2][$j]> $num_triangle[$i+2][$j+2] ) {
#      $i += 2;
#    } 
#    elsif ($num_triangle[$i+2][$j+1]> $num_triangle[$i+2][$j]
#        && $num_triangle[$i+2][$j+1]> $num_triangle[$i+2][$j+2] ) {
#      $i += 2;
#      $j++;
#    } else {
#      $i += 2;
#      $j += 2;
#    }
#  }

}
print "\n-------------\n";
print $sum;
print "\n-------------\n";
