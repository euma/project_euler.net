use strict;
use warnings;
use bignum;
sub prime_lists {
  my $N=shift;
  my @primes=();
  my @is_prime = ();
  for (my $i=0;$i<=$N;$i++) {
    $is_prime[$i]=1;
  }
  for (my $i=2;$i*$i<=$N;$i++) {
      if ($is_prime[$i]) {
          for (my $j=$i;$i*$j<=$N;$j++) {
              $is_prime[$i*$j]=0;
          }
      }
  }
  for (my $i=2;$i<=$N;$i++) {
      if ($is_prime[$i]) { push(@primes,$i); }
  }
  return @primes;
}
sub find_primes {
  my $n = shift;
  my @primes_list = prime_lists($n);
  my $max=0;
  my $min=0;
  #print join(" -- ",@primes_list);
  #print "\n";
  for (my $i=0;$i<$#primes_list+1;$i++) {
    my $first=1;
    while ( $n % $primes_list[$i] == 0 ) {
      #print "$primes_list[$i] -- ";
      $max++;
      $n /= $primes_list[$i];
      if ($first) { $min++;$first=0; }
    }
  }
  return ($max, $min);
}
#my $n=$ARGV[0];
#my ($n_max,$n_min) = find_primes($n);
#print "\n$n $n_max $n_min\n";
my $max=500;
for (my $n=1;$n<$max;$n++) {
  my $total_primes_max=0;
  my $total_primes_min=0;
  if ($n % 2 == 0) {
    my ($n1_max,$n1_min) = find_primes($n/2);
    my ($n2_max,$n2_min) = find_primes($n+1);
    $total_primes_max=$n1_max+$n2_max;
    $total_primes_min=$n1_min+$n2_min;
  } else {
    my ($n1_max,$n1_min) = find_primes($n);
    my ($n2_max,$n2_min) = find_primes(($n+1)/2);
    $total_primes_max=$n1_max+$n2_max;
    $total_primes_min=$n1_min+$n2_min;

  }
  my $triangle_factors_max=2**$total_primes_max-1;
  my $triangle_factors_min=2**$total_primes_min-1;
  if ($triangle_factors_max > 500 || $triangle_factors_min >500) {
    print "\n somethin maybe find!\n";
    print $n*($n+1)/2," $triangle_factors_max $triangle_factors_min\n";
  }
}
