use strict;
use warnings;

#is slow!
my $coefficient_product=1;
my $limit=1000;
#my $limit=42;
my $max_ab_n=0;
my $a=-$limit+1;
while ($a<$limit) {
  my $b=-$limit+1;
  while ($b<$limit) {
    #($limit-1)-$a/2>(-$a/2)-(-$limit+1) <=> $a>0
    my $max=0;
    if ($a > 0) { $max=($limit-1)*($limit-1)+$a*($limit-1)+$b; }
    else { $max=(-$limit+1)*(-$limit+1)+$a*(-$limit+1)+$b; }
    #print "$a $b $max\n";
    my @is_prime;
    for (my $i=0;$i<=$max;$i++) {
      $is_prime[$i]=1;
    }
    for (my $i=2;$i*$i<=$max;$i++) {
        if ($is_prime[$i]) {
            for (my $j=$i;$i*$j<=$max;$j++) {
                $is_prime[$i*$j]=0;
            }
        }
    }
    $is_prime[0]=0;
    $is_prime[1]=0;
    #for (my $i=0;$i<=$max;$i++) {
    #  print "$i $is_prime[$i]\n";
    #}
    #print "\n-------------------\n";

    my $n=0;
    while (1) {
      my $test=$n*$n+$a*$n+$b;
      if ($is_prime[$test]) {
        $n++;
      } else {
        last;
      }
    }
    #if ($n > 0) { print "$a $b $n\t",$a*$b,"\n"; }
    #if ($n > 1) { print "$a $b $n\t",$a*$b,"\n"; }
    if ($n > $max_ab_n) {
      $max_ab_n=$n;
      $coefficient_product=$a*$b;
      print "$a $b $n\t",$a*$b,"\n";
    }
    $b++;
  }
  $a++;
}
print "\n",$max_ab_n,"\n";
print "\n",$coefficient_product,"\n";
