use strict;
use warnings;

#my $limit=1000;
my $limit=1000000;
my $crosslimit = int(sqrt($limit));
#sieve := new boolean array [2 .. limit] false
my @sieve = (1,1);
for (my $i = 2;$i<=$limit;$i++) {
  push(@sieve,0);
}
# mark even numbers > 2
for (my $n = 4; $n<= $limit; $n += 2) {
  $sieve[$n] = 1;
}
for (my $n = 3; $n<= $crosslimit; $n += 2) {
  # n not marked, hence prime
  if (not $sieve[$n]) {
    for (my $m = $n*$n; $m<=$limit; $m += 2*$n) {
      $sieve[$m] = 1;
    }
  }
}
my @prime_array=();
for (my $n = 2; $n<=$limit; $n++) {
  if (not $sieve[$n]) {
    push(@prime_array,$n);
  }
}
#print join(" -- ",@prime_array),"\n";
#print "\n----------------------\n";
#count circular prime
my $count=0;
foreach (@prime_array) {
  #if ($_ =~ /0/) { print "$_ find 0"; }
  #else { print $_," -- "; }
  #if prime contain 0,2,4,6,8 then it's ratation number can not prime when 0,2,4,6,8 ratate to the end of number!
  #if ($_ !~ /0/) { print "$_ -- "; }
  #if ($_ !~ /[02468]/) { print "$_ -- "; }
  #else { print $_," find 0 or 2 or 4 or 6 or 8"; }
  if ($_ !~ /[024685]/) {
    print "$_ -- ";
    my @prime_split=split("",$_);
    #print join(":",@prime_split); print " -- ";
    my $index=0;
    for (my $i=0;$i<$#prime_split;$i++) {
      my $first_char=shift @prime_split;
      push(@prime_split,$first_char);
      #print join("",@prime_split)," -- ";
      my $new_number=join("",@prime_split);
      #print $new_number," -- ";
  
      #if $new_number is prime number!
      if (not $sieve[$new_number]) {
        print "$new_number(is prime)";
        $index++;
      } else {
        print "$new_number(is not prime)";
      }
    }
    #print "($index)($#prime_split)";
    if ($index == $#prime_split) {
      print "[$_] again!";
      $count++;
    }
  }
  print "\n";
}
#there 2 and 5 is circular prime but above count don't count! so 
#there we add 2!
$count += 2;
print "\n$count\n";
