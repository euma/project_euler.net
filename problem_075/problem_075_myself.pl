use strict;
use warnings;

my $L=$ARGV[0];
for (my $i=12;$i<=$L;$i+=2) {
  #a<b<c a+b+c=L
  #so a+(a+1)+(a+2)<=L
  #so a<=L/3-1
  for (my $a=3;$a<=int($i/3-1);$a++) {
    #a*a+b*b=c*c, a+b+c=L, we get b=f(a,L)
    my $b=(2*$a*$i-$i*$i)/(2*$a-2*$i);
    if (int($b) == $b) {
      my $c=$i-$a-$b;
      print "$i: ";
      print "$a $b $c (";
      print $a*$a, " + ", $b*$b, " = ", $c*$c;
      print " = ", $a*$a + $b*$b,")\n";
      print "---------------------\n";
    }
  }
}
