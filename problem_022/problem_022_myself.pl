open FILE, "names.txt" or die $!;
my @lines=<FILE>;
#print join(" -- ",@lines),"\n";
#my @words=split(/,/,$lines[0]);
$lines[0] =~ s/"/,/g;
my @words=split(/,+/,$lines[0]);
@words = sort @words;
#my @words=split(/(",")/,$lines[0]);
#my @words=split(/\w/,$lines[0]);
#print join("\n",@words),"\n";
sub sum_char {
  my $str=shift;
  my @chars=split(//,$str);
  my $sum=0;
  foreach (@chars) {
    $sum+= (ord($_)-ord('A')+1);
  }
  return $sum;
}
my $score_sum=0;
my $i=0;
foreach (@words) {
  print "$i: $_ : ",length($_)," ",sum_char($_),"\n";
  $score_sum += ($i*sum_char($_));
  $i++;
}
print "\n----------------\n";
print $score_sum;
print "\n----------------\n";
#my @words2=();
#foreach (@words) {
#  if (length($_)) { push(@words2,$_); }
#}
#my $i=0;
#foreach (@words2) {
#  print "$i: $_ : ",length($_),"\n";
#  $i++;
#}
#
#my $i=0;
#while (<FILE>) {
#  print "\n$i\n";
#  print $_;
#  $i++;
#}
#my $i=0;
#while (my $line = <FILE>) {
#  print "\n$i\n";
#  print $line;
#  $i++;
#}
close FILE or die $!;
