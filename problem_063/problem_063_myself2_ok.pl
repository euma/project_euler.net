use strict;
use warnings;

sub log10 {
  my $n=shift;
  return log($n)/log(10);
}
my $sum=0;
for (my $a=1;$a<=9;$a++)
{
  my $n=int(1/(1-log10($a)));
  print "$n ";
  $sum += $n;
}
print "\n$sum\n";
