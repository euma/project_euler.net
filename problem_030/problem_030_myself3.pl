use strict;
use warnings;

my $whole_sum=0;
for (my $i=2;$i<10**6;$i++) {
  my $sum=0;
  my $tmp_i=$i;
  while ($tmp_i =~ /^(\d)(\d+)$/) {
    $sum += $1**5;
    $tmp_i=$2;
  }
  $sum += $tmp_i**5;
  if ($sum == $i) {
    print "$i\n";
    $whole_sum += $sum;
  }
}
print "\n",$whole_sum,"\n";
#my $i=10;
#my $i=11;
#my $i=111;
#if ($i =~ /^(\d)(\d+)$/) { print "\nmatch:$1 $2\n"; }
#if ($i =~ /^(\d)(\d*)$/) { print "\nmatch:$1 $2\n"; }
#else { print "don't match $1 $2\n"; }
#my $i=123;
#while ($i =~ /^(\d)(\d*)$/) {
#  print "$i $1\n";
#  $i=$2;
#}
#my $i=4151;
#my $i=4153;
#my $sum=0;
#my $tmp_i=$i;
#while ($tmp_i =~ /^(\d)(\d+)$/) {
#  print "$1 $2\n";
#  $sum += $1**5;
#  $tmp_i=$2;
#}
#print "\n",$tmp_i,"\n";
#if ($sum == $i) { print "$i\n"; }
