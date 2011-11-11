use strict;
use warnings;

#Algorithm ZS1
#for i = 1 to n do x[i] = 1;
#x[1]=n; m=1; h=1; print x[1];
#while x[1] != 1 do {
#  if x[h]==2 then {m = m +1; x[h]=1; h = h - 1}
#  else{ r = x[h]-1;t=m-h+1; x[h]=r;
#    while t>=r do { h = h + 1 ; x[h]=r ; t = t - r }
#    if t==0 then m=h
#    else{m=h+1:
#      if t > 1 then {h= h + 1; x[h]=t}
#      }
#output x[1],x[2],...,x[m]}
#
my $n=$ARGV[0];
my @x=();
for (my $i = 1; $i<=$n; $i++) {
  $x[$i] = 1;
}
$x[1]=$n;
my $m=1;
my $h=1;
while ($x[1] != 1) {
  if ($x[$h]==2) {
    $m = $m +1;
    $x[$h]=1;
    $h = $h - 1;
  }
  else{
    my $r = $x[$h]-1;
    my $t=$m-$h+1;
    $x[$h]=$r;
    while ($t>=$r) {
      $h = $h + 1;
      $x[$h]=$r;
      $t = $t - $r;
    }
    if ($t==0) { $m=$h; }
    else{
      $m=$h+1;
      if ($t > 1) { $h= $h + 1; $x[$h]=$t; }
    }
  }
}
print "@x\n";
