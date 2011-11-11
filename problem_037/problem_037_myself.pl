use strict;
use warnings;
#use bignum;
#perl problem_037_myself.pl 100000000
#Killed 

#my $num=3797;
##print length($num),"\n";
#my $l=length($num);
#for (my $i=1;$i<$l;$i++) {
#  #$num =~ /\d(\d{$i})$/;
#  #print $1,"\n";
#  $num =~ /^(\d{$i})\d/;
#  print $1,"\n";
#}
#my $n=100;
#my $n=10000;
my $n=$ARGV[0];
my $sum=0;
my @is_prime;
my $index=0;
for (my $i=0;$i<=$n;$i++) {
  $is_prime[$i]=1;
}
for (my $i=2;$i*$i<=$n;$i++) {
  if ($is_prime[$i]) {
    for (my $j=$i;$i*$j<=$n;$j++) {
      $is_prime[$i*$j]=0;
    }
  }
}
$is_prime[0]=0;
$is_prime[1]=0;
#$i start at 10 means don't consider 2,3,5,7 primes!
for (my $i=10;$i<=$n;$i++) {
  if ($is_prime[$i]) {
    #if ($i =~ /[02468]/) { print $i,"()"; }
    #else { print $i,"(not)"; }
    if ($i !~ /[02468]/) {
      my $l=length($i);
      my $is_truncatable_prime=1;
      for (my $j=1;$j<$l;$j++) {
        $i =~ /\d(\d{$j})$/;
        if (not $is_prime[$1]) {
          $is_truncatable_prime=0;
          last;
        }
        $i =~ /^(\d{$j})\d/;
        if (not $is_prime[$1]) {
          $is_truncatable_prime=0;
          last;
        }
      }
      if($is_truncatable_prime) { print "$index:$i\n"; $sum += $i; $index++; }
      #else { print $i,"()\n"; }
    }
  }
}
print "\n$sum\n";
