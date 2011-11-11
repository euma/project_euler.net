use strict;
use warnings;

sub gcd {
  my ($a, $b)=@_;
  while ($b != 0) {
    my $t = $b;
    $b = $a % $b;
    $a = $t;
  }
  return $a;
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


my $target=$ARGV[0]-1;
my @is_prime=();
for (my $i=0;$i<=$target;$i++) {
  $is_prime[$i]=1;
}
for (my $i=2;$i*$i<=$target;$i++) {
    if ($is_prime[$i]) {
        for (my $j=$i;$i*$j<=$target;$j++) {
            $is_prime[$i*$j]=0;
        }   
    }   
}
print "\ncreate prime array is ok!\n";
my @totient_arr=(0,1);
for (my $i=2;$i<=$target;$i++) {
  if ($is_prime[$i]) {
    $totient_arr[$i]=$i-1;
  }
}
print "\ncreate prime totient is ok!\n";
#totient(m*n) = totient(m)*totient(n)*d/totient(d) where d = gcd(m,n).
for (my $i=2;$i*$i<=$target;$i++) {
  for (my $j=$i;$i*$j<=$target;$j++) {
    my $d=gcd($i,$j);
    print "gcd($i,$j)=$d\n";
    if (defined($totient_arr[$i]) and defined($totient_arr[$j]) and defined($totient_arr[$d])) {
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
