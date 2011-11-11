#our @num_triangle = (
#  [75],
#  [95, 64],
#  [17, 47, 82],
#  [18, 35, 87, 10],
#  [20, 4, 82, 47, 65],
#  [19, 1, 23, 75, 3, 34],
#  [88, 2, 77, 73, 7, 63, 67],
#  [99, 65, 4, 28, 6, 16, 70, 92],
#  [41, 41, 26, 56, 83, 40, 80, 70, 33],
#  [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
#  [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
#  [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
#  [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
#  [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
#  [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]
#);
#
my @num_triangle = (
  [3],
  [7, 4],
  [2, 4, 6],
  [8, 5, 9, 3],
);
#for (my $i=0;$i<=$#num_triangle;$i++) {
#  #print $num_triangle[$i],"\n";
#  for (my $j=0;$j<=$#{$num_triangle[$i]};$j++) {
#    print $num_triangle[$i][$j]," -- ";
#  }
#  print "\n";
#}
#my $triangle_height = 4;
#my $triangle_height = $#num_triangle ;
#sub progress {
#  my ($height,$width)=@_;
#  my $total_path = 0;
#  if ($height < $triangle_height) {
#    $total_path += progress($height + 1, $width);
#    $total_path += progress($height + 1, $width + 1);
#  }
#  if ($height == $triangle_height) {
#    return 1;
#  }
#  return $total_path;
#}
#print progress(0, 0),"\n";
my $triangle_height = $#num_triangle ;
my @all_path_list=();
sub progress {
  my ($height,$width)=@_;
  #print "\n($height,$width)\n";
  my $total_path = 0;
  if ($height < $triangle_height) {
    my $height_plus=$height + 1;
    my $width_plus=$width + 1;
    $total_path += progress($height_plus, $width);
    push(@all_path_list,"($height_plus,$width)");
    $total_path += progress($height_plus, $width_plus);
    push(@all_path_list,"($height_plus,$width_plus)");
  }
  if ($height == $triangle_height) {
    return 1;
  }
  return $total_path;
}
print progress(0, 0),"\n";
print join(" -- ",@all_path_list);
