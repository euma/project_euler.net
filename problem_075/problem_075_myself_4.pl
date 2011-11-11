use strict;
use warnings;

my $L=$ARGV[0];
my $i_count=0;
for (my $i=12;$i<=$L;$i+=2) {
  #a<b<c a+b+c=L
  #so a+(a+1)+(a+2)<=L
  #so a<=L/3-1
  print "$i\n";
  my $local_count=0;
  for (my $a=3;$a<=int($i/3-1);$a++) {
    #a*a+b*b=c*c, a+b+c=L, we get b=f(a,L)
    my $b=(2*$a*$i-$i*$i)/(2*$a-2*$i);
    if (int($b) == $b) {
      my $c=$i-$a-$b;
      print "$a $b $c\n";
      $local_count++;
      if ($local_count > 1) { last; }
    }
  }
  if ($local_count==1) {$i_count++;}
}
print "\n$i_count\n";
