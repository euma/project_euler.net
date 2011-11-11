use strict;
use warnings;

#use is_prime is very slow!
sub is_prime {
    my $n=shift;
    if ($n <= 1) { return 0; }
    elsif ($n < 4) { return 1; } #2 and 3 are prime
    elsif ($n % 2 == 0) { return 0; }
    elsif ($n < 9) { return 1; } # 5 and 7 are prime and we have already excluded 4,6 and 8.
    elsif ($n % 3 == 0) { return 0; }
    else {
        my $r=int(sqrt($n)); # sqrt(n) rounded to the greatest integer r so that r*r<=n
        #All primes greater than 3 can be written in the form 6k+/-1.
        #so k=1 p=5 or 7;
        #   k=2 p=11 or 13;
        #   k=3 p=17 or 19;
        #   k=4 p=23 or 25;
        my $f=5;
        while ($f<=$r) {
            if ($n % $f == 0) { return 0; }
            if (($n % ($f+2)) == 0) { return 0; }
            $f = $f + 6;
        }
        return 1;
    }
}

my $largest=$ARGV[0];
if ($largest % 2 == 0) {
  $largest++;
}
my $max_step=($largest-1)/2;
my $sum=1;
my $step=1;
my $step_change=0;
my $total_prime=0;
while ($step<=$max_step) {
  $sum += 2*$step;
  if ($step_change != 3 and is_prime($sum))
  {
    $total_prime++;
  }
  $step_change++;
  if ($step_change == 4)
  {
    my $total_all=4*$step+1;
    my $spiral_size=2*$step+1;
    my $quot= $total_prime/$total_all;
    print "$spiral_size: ";
    print "$total_prime/$total_all = ";
    print "$quot\n";
    if ($quot < 0.1) {
      print "$spiral_size: ";
      exit 0;
    }
    $step++;
    $step_change=0;
  }
}
