use strict;
use warnings;
use bignum;

my $first=1;
my $second=1;
#for (my $i=0;$i<$n;$i++) {
my $index=1;
while (1) {
  my $tmp_first=$first;
  #print $first,"\n";
  if ($first =~ /^\d{1000}$/) { print "$index: $first\n"; last; }
  #if ($first =~ /^\d{3}$/) { print "$index: $first\n"; last; }
  $first=$second;
  $second=$tmp_first + $second;
  $index++;
}
