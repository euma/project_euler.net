use strict;
use warnings;

my $digit=4;
my $start=10**($digit-1);
my $end=10**($digit)-1;
print "$start $end\n";
print "--------------triangle-----------------\n";
my $start3=0;
my $num=sqrt(1+8*$start)/2-1/2;
if ($num == int($num))
{
  $start3=$num;
}
else
{
  $start3=int($num)+1;
}
my $end3=0;
$num=sqrt(1+8*$end)/2-1/2;
if ($num == int($num))
{
  $end3=$num;
}
else
{
  $end3=int($num);
}
#for (my $i=$start3;$i<=$end3;$i++) {
#  print $i*($i+1)/2;
#  print " ";
#}
print "$start3 $end3\n";
for (my $i=$start3-1;$i<=$end3+1;$i++) {
  print $i*($i+1)/2;
  print " ";
}
print "\n--------------square-----------------\n";
my $start4=0;
$num=sqrt($start);
if ($num == int($num))
{
  $start4=$num;
}
else
{
  $start4=int($num)+1;
}
my $end4=0;
$num=sqrt($end);
if ($num == int($num))
{
  $end4=$num;
}
else
{
  $end4=int($num);
}
#for (my $i=$start4;$i<=$end4;$i++) {
#  print $i*($i+1)/2;
#  print " ";
#}
print "$start4 $end4\n";
for (my $i=$start4-1;$i<=$end4+1;$i++) {
  print $i*$i;
  print " ";
}
print "\n=======================\n";
