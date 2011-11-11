use strict;
use warnings;
#use bignum;

sub factorial {
  my $n=shift;
  if ($n < 0) {
    return 0;
  } else {
    my $product=1;
    for (my $i=2;$i<=$n;$i++) {
      $product *= $i;
    }
    return $product;
  }
}
my $max=$ARGV[0];
my $sum=0;
for (my $i=10;$i<$max;$i++) {
  my @i_split=split("",$i);
  my $i_fib_sum=0;
  foreach (@i_split) {
    $i_fib_sum += factorial($_);
  }
  if ($i == $i_fib_sum) {
    $sum += $i;
    #print $i," -- ";
    #foreach (@i_split) {
    #  print factorial($_), " ";
    #}
    #print " = ",$i_fib_sum,"\n";
  }
}
print "\n",$sum,"\n";
