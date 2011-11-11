use strict;
use warnings;
my $p_max_times=0;
my $p_max_number=0;
for (my $p=4;$p<=1000;$p += 2) {
  my $p_times=0;
  for (my $a = 3; $a < ($p-3)/3; $a++) {
    for (my $b = ($a+1); $b < ($p-1-$a)/2; $b++) {
      my $c = $p - $a - $b;
      if ($c*$c == $a*$a + $b*$b) {
        print "($a,$b,$c)\n";
        $p_times++;
      }
    }
  }
  if ($p_times > $p_max_times) {
    $p_max_times = $p_times;
    $p_max_number = $p;
  }
}
print "\n$p_max_number:$p_max_times\n";
