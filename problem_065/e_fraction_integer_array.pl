use strict;
use warnings;

my $len=$ARGV[0];
$a=2;
print "$a ";
$len--;
my $max=int($len/3);
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
if ($len % 3 == 2) {
  $a=1;
  print "$a ";
  $a=2*($i+1);
  print "$a ";
} elsif ($len % 3 == 1) {
  $a=1;
  print "$a ";
}
print "\n";
