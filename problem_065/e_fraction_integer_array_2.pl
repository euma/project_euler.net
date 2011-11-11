use strict;
use warnings;

my $limit=$ARGV[0];
for (my $len=1;$len<=$limit;$len++) {
  my $a=2;
  print "$a ";
  my $len_tmp=$len-1;
  my $max=int($len_tmp/3);
  #print "($max)";
  my $i=0;
  while ($i<$max)
  {
    $a=1;
    print "$a ";
    $a=2*($i+1);
    print "$a ";
    $a=1;
    print "$a ";
    $i++;
  }
  if ($len_tmp % 3 == 2) {
    $a=1;
    print "$a ";
    $a=2*($i+1);
    print "$a ";
  } elsif ($len_tmp % 3 == 1) {
    $a=1;
    print "$a ";
  }
  print "\n";
}
