use strict;
use warnings;
use Algorithm::Permute;

my $digit=4;
my $start=10**($digit-1);
my $end=10**($digit)-1;
my $start3=0;
sub triangle_num
{
  my $n=shift;
  return $n*($n+1)/2;
}
sub square_num
{
  my $n=shift;
  return $n*$n;
}
sub pentagonal_num
{
  my $n=shift;
  return $n*(3*$n-1)/2;
}
sub hexagonal_num
{
  my $n=shift;
  return $n*(2*$n-1);
}
sub heptagonal_num
{
  my $n=shift;
  return $n*(5*$n-3)/2;
}
sub octagonal_num
{
  my $n=shift;
  return $n*(3*$n-2);
}

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
sub union_function
{
  my $i=shift;
  my $mode=shift;
  if ($mode == 0) { return triangle_num($i); }
  elsif ($mode == 1) { return square_num($i); }
  elsif ($mode == 2) { return pentagonal_num($i); }
  elsif ($mode == 3) { return hexagonal_num($i); }
  elsif ($mode == 4) { return heptagonal_num($i); }
  elsif ($mode == 5) { return octagonal_num($i); }
  else { return -1; }
}
my @start_num=($start3,$start4,$start5);
my @end_num=($end3,$end4,$end5);

my $size=3;
my $p = new Algorithm::Permute([0 .. $size-1]);
while (my @res = $p->next)
{
  print join("", @res), "\n";
  my $p1=$res[0];
  my $p2=$res[1];
  my $p3=$res[2];
  for (my $i=$start_num[$p1];$i<=$end_num[$p1];$i++)
  {
    my $n1n=union_function($i,$p1);
    $n1n=~/(\d\d)(\d\d)/;
    my $n1a=$1;
    my $n1b=$2;
    for (my $j=$start_num[$p2];$j<=$end_num[$p2];$j++) {
      my $n2n=union_function($j,$p2);
      $n2n=~/(\d\d)(\d\d)/;
      my $n2a=$1;
      my $n2b=$2;
      if ($n1b == $n2a)
      {
	for (my $k=$start_num[$p3];$k<=$end_num[$p3];$k++) {
	  my $n3n=union_function($k,$p3);
	  $n3n=~/(\d\d)(\d\d)/;
	  my $n3a=$1;
	  my $n3b=$2;
	  if ($n2b == $n3a and $n3b == $n1a)
	  {
	    print "$n1n $n2n $n3n\n";
	  }
	}
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

