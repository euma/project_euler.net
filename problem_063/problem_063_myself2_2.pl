use strict;
use warnings;
use bignum;

sub log10 {
  my $n=shift;
  return log($n)/log(10);
}
my $sum=0;
for (my $a=1;$a<=9;$a++)
{
  my $n=int(1/(1-log10($a)));
  #print "$n ";
  for (my $i=1;$i<=$n;$i++)
  {
    print "$a ** $i = ";
    my $num= $a**$i;
    print "$num (";
    print length($num);
    print ")\n";
  }
  print "\n------------------\n";
  $sum += $n;
}
print "\n$sum\n";
