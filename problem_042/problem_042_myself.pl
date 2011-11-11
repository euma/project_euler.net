sub word_value {
  my $word=shift;
  my @word_arr=split("",$word);
  my $value=0;
  foreach (@word_arr) {
    print "$_ -- ";
    print (ord($_)-ord('a') + 1);
    print " -- ";
    $value += (ord($_)-ord('a') + 1);
  }
  return $value;
}
my $str="sky";
print word_value($str);
print "\n";
