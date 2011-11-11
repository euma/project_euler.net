use strict;
use warnings;

my $digit=4;
my $start=10**($digit-1);
my $end=10**($digit)-1;
my $start3=0;
my $num=sqrt(1+8*$start)/2-1/2;
if ($num == int($num)) { $start3=$num; }
else { $start3=int($num)+1; }
my $end3=0;
$num=sqrt(1+8*$end)/2-1/2;
if ($num == int($num)) { $end3=$num; }
else { $end3=int($num); }

my $start4=0;
$num=sqrt($start);
if ($num == int($num)) { $start4=$num; }
else { $start4=int($num)+1; }
my $end4=0;
$num=sqrt($end);
if ($num == int($num)) { $end4=$num; }
else { $end4=int($num); }

my $start5=0;
$num=sqrt(24*$start+1)/6+1/6;
if ($num == int($num)) { $start5=$num; }
else { $start5=int($num)+1; }
my $end5=0;
$num=sqrt(24*$end+1)/6+1/6;
if ($num == int($num)) { $end5=$num; }
else { $end5=int($num); }

for (my $i=$start3;$i<=$end3;$i++)
{
  my $n3n=$i*($i+1)/2;
  $n3n=~/(\d\d)(\d\d)/;
  my $n3a=$1;
  my $n3b=$2;
  for (my $j=$start4;$j<=$end4;$j++) {
    my $n4n=$j*$j;
    $n4n=~/(\d\d)(\d\d)/;
    my $n4a=$1;
    my $n4b=$2;
    for (my $k=$start5;$k<=$end5;$k++) {
      my $n5n=$k*(3*$k-1)/2;
      $n5n=~/(\d\d)(\d\d)/;
      my $n5a=$1;
      my $n5b=$2;
      if ($n3b == $n4a and $n4b == $n5a and $n5b == $n3a)
      {
	print "$n3n $n4n $n5n\n";
      }
    }
  }
}
#print "\n--------------hexagonal-----------------\n";
#my $start6=0;
#$num=sqrt(8*$start+1)/4+1/4;
#if ($num == int($num))
#{
#  $start6=$num;
#}
#else
#{
#  $start6=int($num)+1;
#}
#my $end6=0;
#$num=sqrt(8*$end+1)/4+1/4;
#if ($num == int($num))
#{
#  $end6=$num;
#}
#else
#{
#  $end6=int($num);
#}
#print "$start6 $end6\n";
#for (my $i=$start6-1;$i<=$end6+1;$i++) {
#  print $i*(2*$i-1);
#  print " ";
#}
#
#print "\n--------------heptagonal-----------------\n";
#my $start7=0;
#$num=sqrt(40*$start/9+1)*3/10+3/10;
#if ($num == int($num))
#{
#  $start7=$num;
#}
#else
#{
#  $start7=int($num)+1;
#}
#my $end7=0;
#$num=sqrt(40*$end/9+1)*3/10+3/10;
#if ($num == int($num))
#{
#  $end7=$num;
#}
#else
#{
#  $end7=int($num);
#}
#print "$start7 $end7\n";
#for (my $i=$start7-1;$i<=$end7+1;$i++) {
#  print $i*(5*$i-3)/2;
#  print " ";
#}
#
#print "\n--------------octagonal-----------------\n";
#my $start8=0;
#$num=sqrt(3*$start+1)/3+1/3;
#if ($num == int($num))
#{
#  $start8=$num;
#}
#else
#{
#  $start8=int($num)+1;
#}
#my $end8=0;
#$num=sqrt(3*$end+1)/3+1/3;
#if ($num == int($num))
#{
#  $end8=$num;
#}
#else
#{
#  $end8=int($num);
#}
#print "$start8 $end8\n";
#for (my $i=$start8-1;$i<=$end8+1;$i++) {
#  print $i*(3*$i-2);
#  print " ";
#}
#print "\n=======================\n";
