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
sub dec2bin {
    my $str = unpack("B32", pack("N", shift));
    my $n = shift;
    #print "\n$str\n";
    #$str =~ s/^0+(?=\d)//;   # otherwise you'll get leading zeros
    $str =~ s/^\d+(\d{$n})/$1/;
    #print "\n$str\n";
    return $str;
}
####################################
#test for use binary integer!
#my $dec=10;
#my $bin=dec2bin($dec,5);
#@each_bit=split(//,$bin);
#print join(" -- ",@each_bit);
#print "\n";
#print $each_bit[0],"\n";
#print $each_bit[1],"\n";
######################################
my $max_sum=0;
#print $#num_triangle;
for (my $k=0;$k<2**$#num_triangle;$k++) {
  my @k_each_bit=split(//,dec2bin($k,$#num_triangle));
  #print join(" -- ",@k_each_bit);
  #print "\n";
  my $i=0;
  my $j=0;
  my $sum=0;
  while (1) {
    #print $num_triangle[$i][$j]," -- ";
    $sum += $num_triangle[$i][$j];
    if ($i == $#num_triangle) { last; }
    if ($k_each_bit[$i]) {
      $i++;
    }
    else {
      $i++;
      $j++;
    }
  }
  #print "\n$sum\n";
  if ($sum > $max_sum) { $max_sum=$sum; }
}
print $max_sum,"\n";
