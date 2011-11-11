#2 -- 6 3 -- 20 4 -- 70 5 -- 252 6 -- 924 7 -- 3432 8 -- 12870 9 -- 48620 10 -- 184756 11 -- 705432 
@arr = (1,2,6,20,70,252,,924,3432,12870,48620,184756,705432);
for (my $i=0;$i<$#arr+1;$i++) {
  print $arr[$i]," -- ";
}
print "\n------------------------\n";
#for (my $i=0;$i<$#arr;$i++) {
#  print 3**$i," -- ";
#}
#print "\n------------------------\n";
#print "\n------------------------\n";
#for (my $i=0;$i<$#arr+1;$i++) {
#  print 2**(2*$i)-$arr[$i]," -- ";
#}
my @delta1=();
for (my $i=0;$i<$#arr;$i++) {
  print $delta1[$i]=$arr[$i+1]-$arr[$i]," -- ";
}
print "\n------------------------\n";
for (my $i=0;$i<$#arr;$i++) {
  print (($i+1)*(2^($i+1)));
  print " -- ";
}
print "\n------------------------\n";
#my @delta2=();
#for (my $i=0;$i<$#delta1;$i++) {
#  print $delta2[$i]=$delta1[$i+1]-$delta1[$i]," -- ";
#}
#print "\n------------------------\n";
#my @delta3=();
#for (my $i=0;$i<$#delta2;$i++) {
#  print $delta3[$i]=$delta2[$i+1]-$delta2[$i]," -- ";
#}
#print "\n------------------------\n";
#my @delta4=();
#for (my $i=0;$i<$#delta3;$i++) {
#  print $delta4[$i]=$delta3[$i+1]-$delta3[$i]," -- ";
#}
print "\n------------------------\n";

#for (my $i=0;$i<$#arr;$i++) {
#  print $arr[$i+1]/$arr[$i]," -- ";
#}
#print "\n------------------------\n";
#for (my $i=0;$i<$#arr;$i++) {
#  print $arr[$i]/3**$i," -- ";
#}
#print "\n------------------------\n";
#
