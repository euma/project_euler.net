use strict;
use warnings;

my $limit=1000;
my $sievebound = ($limit-1) / 2;# last index of sieve
#sieve := new boolean array [1 .. sievebound] false
my @sieve=();
foreach (0 .. $sievebound) {
  push(@sieve,0);
}
my $crosslimit = (int(sqrt($limit)) -1) / 2;
for (my $i=1;$i<=$crosslimit;$i++) {
  if (not $sieve[$i]) { #2*i+1 is prime, mark multiples
    for (my $j=2*$i*($i+1);$j<=$sievebound;$j += (2*$i+1)) {
      $sieve[$j] = 1;
    }   
  }
}
my @prime_array=(2);
for (my $i = 1;$i<=$sievebound;$i++) {
  if (not $sieve[$i]) { push(@prime_array,(2*$i+1)); }
}
#print join(" -- ",@prime_array),"\n";
foreach (@prime_array) {
  print $_," -- ";
  my @prime_split=split("",$_);
  my $index=0;
  #print join(":",@prime_split); print "\n";
  for (my $i=0;$i<$#prime_split;$i++) {
    my $first_char=shift @prime_split;
    push(@prime_split,$first_char);
    #print join("",@prime_split)," -- ";
    my $new_number=join("",@prime_split)," -- ";
    #if $new_number is prime number!
    if (not $sieve[($new_number-1)/2]) {
      $index++;
    }
  }
  if ($index == $#prime_split) { print "$_ again!"; }
  print "$index -- ";
  print "\n-------------\n";
}
print "\n";
