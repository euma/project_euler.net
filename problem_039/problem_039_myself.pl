use strict;
use warnings;

my $p_max=1000;
my $max_p_number=0;
my $max_p=0;
#a+b+c=p and a^2+b^2=c^2,so p is even number.
for (my $p=2;$p<=$p_max;$p += 2) {
  my $p_number=0;
  for (my $a=1;$a<=$p-2;$a++) {
    for (my $b=$a+1;$b<=$p-$a-1;$b++) {
      my $c=$p-$a-$b;
      if ($a*$a+$b*$b == $c*$c) {
        print "$a $b $c\n";
        $p_number++;
      }
    }
  }
  if ($p_number>$max_p_number) {
    $max_p_number = $p_number;
    $max_p=$p;
  }
}
print "\n$max_p: $max_p_number\n";
