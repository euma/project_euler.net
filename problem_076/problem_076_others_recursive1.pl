#func CountCombinations(Number, Minimal)
#  temp = 1
#  if Number<=1 then return 1
#  for i = 1 to Floor(Number/2)
#    if i>=Minimal then
#      temp := temp + CountCombinations(Number-i, i)
#  end for
#  return temp
#end func
sub CountCombinations {
  my $Number=shift;
  my $Minimal=shift;
  print "C($Number,$Minimal)\n";
  my $temp = 1;
  if ($Number<=1) { return 1; }
  for (my $i = 1; $i<=int($Number/2); $i++ ) {
    if ($i>=$Minimal) {
      $temp = $temp + CountCombinations($Number-$i, $i);
    }
  }
  return $temp;
}

my $target=100;
print CountCombinations($target,0)-1;
print "\n";
