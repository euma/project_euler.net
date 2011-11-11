use strict;
use warnings;

my $limit=$ARGV[0];
for (my $N=2;$N<=$limit;$N++)
{
  print sqrt($N);
  print "\n";
}
