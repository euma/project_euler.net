use strict;
use warnings;

#sub gcd {
#  my ($a, $b)=@_;
#  while ($b != 0) {
#    my $t = $b;
#    $b = $a % $b;
#    $a = $t;
#  }
#  return $a;
#}
#replace gcd module to gcd binary!
sub gcd {
  my ($u,$v) = @_;
  my $shift_number;
  if ($u == 0 || $v == 0) { return $u | $v; }
  for ($shift_number = 0; (($u | $v) & 1) == 0; ++$shift_number) {
    $u >>= 1;
    $v >>= 1;
  }
  while (($u & 1) == 0) {
    $u >>= 1;
  }
    do {
    while (($v & 1) == 0) {
      $v >>= 1;
    }
    if ($u < $v) {
      $v -= $u;
    } else {
      my $diff = $u - $v;
      $u = $v;
      $v = $diff;
    }
    $v >>= 1;
  } while ($v != 0);

  return $u << $shift_number;
}


sub is_permutation_pair {
  my $m=shift;
  my $n=shift;
  if (length($m) != length($n)) { return 0; }
  my @split_m=split("",$m);
  my @split_n=split("",$n);
  for (my $i=0;$i<=$#split_m;$i++) {
    my $not_match=0;
    for (my $j=0;$j<=$#split_n;$j++) {
      if ($split_m[$i] == $split_n[$j]) {
        $split_n[$j]=-1;
        last;
      } else {
        $not_match++;
      }
    }
    if ($not_match == $#split_n+1) {
      return 0;
    }
  }
  foreach (@split_n) {
    if ($_ != -1) {
      return 0;
    }
  }
  return 1;
}

#change prime array generate method!
#my $target=$ARGV[0]-1;
#my @is_prime=();
#for (my $i=0;$i<=$target;$i++) {
#  $is_prime[$i]=1;
#}
#for (my $i=2;$i*$i<=$target;$i++) {
#    if ($is_prime[$i]) {
#        for (my $j=$i;$i*$j<=$target;$j++) {
#            $is_prime[$i*$j]=0;
#        }   
#    }   
#}
#new prime array generate method!
my $target=$ARGV[0]-1;
my $sievebound = int(($target-1) / 2);# last index of sieve
#print "$sievebound\n";
#sieve := new boolean array [1 .. sievebound] false
my @sieve=();
foreach (0 .. $sievebound) {
  push(@sieve,0);
}
#for (my $i=0;$i<=$#sieve;$i++) {
#  print "$i:$sieve[$i]\n";
#}
my $crosstarget = int((int(sqrt($target)) -1) / 2);
#print "$crosstarget\n";
for (my $i=1;$i<=$crosstarget;$i++) {
  if (not $sieve[$i]) { #2*i+1 is prime, mark multiples
    for (my $j=2*$i*($i+1);$j<=$sievebound;$j += (2*$i+1)) {
      $sieve[$j] = 1;
    }
  }
}
#for (my $i = 1;$i<=$sievebound;$i++) {
#  if (not $sieve[$i]) {
#    print "$i: ";
#    print 2*$i+1,"\n";
#  }
#}
print "\ncreate prime array is ok!\n";
#my @totient_arr=(0,1);
#for (my $i=2;$i<=$target;$i++) {
#  if ($is_prime[$i]) {
#    $totient_arr[$i]=$i-1;
#  }
#}
my @totient_arr=(0,1,1);#totient(0)=0,totient(1)=1,totient(2)=1;
for (my $i = 1;$i<=$sievebound;$i++) {
  if (not $sieve[$i]) {
    my $prime=2*$i+1;
    $totient_arr[$prime]=$prime-1;
  }
}
print "\ncreate prime totient is ok!\n";
#totient(m*n) = totient(m)*totient(n)*d/totient(d) where d = gcd(m,n).
for (my $i=2;$i*$i<=$target;$i++) {
  for (my $j=$i;$i*$j<=$target;$j++) {
    my $d=gcd($i,$j);
    print "gcd($i,$j) = $d\n";
    if ((not defined($totient_arr[$i*$j])) and defined($totient_arr[$i]) and defined($totient_arr[$j]) and defined($totient_arr[$d])) {
      #$totient_arr[$i*$j]=$totient_arr[$i]*$totient_arr[$j];#this is only for $i and $j is coprime!
      $totient_arr[$i*$j]=$totient_arr[$i]*$totient_arr[$j]*$d/$totient_arr[$d];
    }
  }
}
for (my $i=0;$i<=$#totient_arr;$i++)
{
  if (!defined($totient_arr[$i])) { print "($i)"; }
}
print "\n";

print "\ncreate integer totient is ok!\n";
my $min_n_totient=$target+1;
my $min_n=0;
for (my $i=2;$i<=$#totient_arr;$i++)
{
  my $n_totient=$i/$totient_arr[$i];
  if (is_permutation_pair($i,$totient_arr[$i])) {
    print "$i: $totient_arr[$i] $n_totient\n";
    if ($n_totient < $min_n_totient) { $min_n_totient=$n_totient; $min_n=$i; }
  }
}
print "\n$min_n_totient\n";
print "\n$min_n\n";
