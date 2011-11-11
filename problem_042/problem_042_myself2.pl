open FILE, "words.txt" or die $!;
my @lines=<FILE>;
#print join(" -- ",@lines),"\n";
$lines[0] =~ s/"/,/g;
my @words=split(/,+/,$lines[0]);
@words = sort @words;
#print join("\n",@words),"\n";
sub word_value {
  my $str=shift;
  my @chars=split(//,$str);
  my $sum=0;
  foreach (@chars) {
    $sum+= (ord($_)-ord('A')+1);
  }
  return $sum;
}
sub is_triangle_number {
  my $a = shift;
  if ($a < 1) { return 0; }
  my $n=(sqrt(1+8*$a)-1)/2;
  if ($n == int($n)) {
    return 1;
  } else {
    return 0;
  }
}
my $triangle_words=0;
foreach (@words) {
  if (is_triangle_number(word_value($_))) {
    print "$_: ",word_value($_)," is triangle word!\n";
    $triangle_words++;
  }
}
print "\n----------------\n";
print $triangle_words;
print "\n----------------\n";
close FILE or die $!;
