use strict;
use warnings;
#use bignum;

my $limit=$ARGV[0];
my $sievebound = int(($limit-1) / 2);# last index of sieve
#print "$sievebound\n";
#sieve := new boolean array [1 .. sievebound] false
my @sieve=();
#foreach (0 .. $sievebound) {
for (my $i=0;$i<=$sievebound;$i++) {
  push(@sieve,0);
}
#for (my $i=0;$i<=$#sieve;$i++) {
#  print "$i:$sieve[$i]\n";
#}
my $crosslimit = int((int(sqrt($limit)) -1) / 2);
#print "$crosslimit\n";
for (my $i=1;$i<=$crosslimit;$i++) {
  if (not $sieve[$i]) { #2*i+1 is prime, mark multiples
    for (my $j=2*$i*($i+1);$j<=$sievebound;$j += (2*$i+1)) {
      $sieve[$j] = 1;
    }
  }
}

my $start_sum=2;
my @prime_arr2=(2);
my $longest=0;
my $longest_sum=0;
my @longest_arr;
for (my $i = 1;$i<=$sievebound;$i++) {
  if (not $sieve[$i]) {
    my $prime=2*$i+1;
    push(@prime_arr2,$prime);
    $start_sum += $prime;
    if ($start_sum > $limit) { last; }
    if ($start_sum % 2 != 0) {
      my $test=($start_sum-1)/2;
      if (not $sieve[$test]) {
        my $len=$#prime_arr2+1;
        if ( $len > $longest) {
          $longest=$len;
          @longest_arr=@prime_arr2;
          $longest_sum=$start_sum;
        }
        #print join(" + ",@prime_arr2);
        #print " = $start_sum\n";
      }
    }
  }
}
#
#
for (my $i = 1;$i<$sievebound;$i++) {
  if (not $sieve[$i]) {
    my $prime=2*$i+1;
    my $i_start_sum=$prime;
    my @prime_arr=($prime);
    #print "$prime -- ";
    for (my $j = $i+1;$j<=$sievebound;$j++) {
      if (not $sieve[$j]) {
        my $prime2=2*$j+1;
        #print "$prime2 -- ";
        push (@prime_arr,$prime2);
        $i_start_sum += $prime2;
        if ($i_start_sum > $limit) { last; }
        if ($i_start_sum % 2 != 0) {
          my $test=($i_start_sum-1)/2;
          #print "$test\n";
          if (not $sieve[$test]) {

            my $len=$#prime_arr+1;
            if ( $len > $longest) {
              $longest=$len;
              @longest_arr=@prime_arr;
              $longest_sum=$i_start_sum;
            }
            #print join(" + ",@prime_arr);
            #print " = $i_start_sum\n";
          }
        }
      }
    }
  }
}
print "\n$longest: ";
print join(" + ",@longest_arr);
print " = $longest_sum\n";
