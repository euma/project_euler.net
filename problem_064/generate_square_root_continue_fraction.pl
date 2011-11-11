use strict;
use warnings;

my $limit=$ARGV[0];
my $length=$ARGV[1];
for (my $N=2;$N<=$limit;$N++)
{
  my $num=sqrt($N);
  if ($num != int($num)) {
    print "$N: $num\n";
    my $a=int($num);
    my $x=$num;
    for (my $i=0;$i<$length;$i++) {
      print "$a  ";
      $x=$x-$a;
      $x=1/$x;
      $a=int($x);
    }
    print "\n";
  }
  print "=================\n\n";
}
