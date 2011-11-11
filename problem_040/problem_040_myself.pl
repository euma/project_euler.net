use strict;
use warnings;

#my $sum=9;
#for (my $i=0;$i<9;$i++) {
#  $sum += 20;
#}#sum to 99
#print $sum,"\n";
#for (my $i=0;$i<9;$i++) {
#  $sum += 300;
#}#sum to 999
#print $sum,"\n";
#for (my $i=0;$i<9;$i++) {
#  $sum += 4000;
#}#sum to 9999
#print $sum,"\n";
#for (my $i=0;$i<9;$i++) {
#  $sum += 50000;
#}#sum to 99999
#print $sum,"\n";
#for (my $i=0;$i<9;$i++) {
#  $sum += 600000;
#}#sum to 999999
#print $sum,"\n";
my $max=1000000;
#my $max=100;
my $str="";
for (my $i=1;$i<$max;$i++) {
  $str = $str . "$i";
}
#print "$str\n";
my @n_arr=(1,10,100,1000,10000,100000,1000000);
foreach (@n_arr) {
  my $n=$_;
  my $nth = substr($str, $n-1, 1);
  print "$nth\n";
}
#my @str_arr = unpack("C*", $str);
#print "\n$str_arr[1]\n";
#print "\n$str_arr[2]\n";
