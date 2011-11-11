use warnings;
use strict;
use bignum;
sub prime_number_list {
    my $n=shift;
    my @prime_list=(2);
    for (my $i=3;$i<=$n;$i++) {
        my $is_prime=0;
        if ($i%2==0){$is_prime=1;}
        for(my $factor=3;$factor<=sqrt($i);$factor=$factor+2) {
            if ($i % $factor == 0) {
                #print "$n is not a prime number.\n";
                $is_prime = 1;
                last;
            }
        }
        if ($is_prime == 0) {
            push(@prime_list,$i);
            #print "$n is a prime number.\n";
        }
    }
    return @prime_list;
}
my $n=20;
#my $n=10;#ok!
my $factorial_n=1;
for(my $k=2;$k<=$n;$k++) {
    $factorial_n *= $k;
}
print $factorial_n,"\n";
#
my $prime_factorial_n=1;
my @n_prime_factors=prime_number_list($n);
for(my $k=0;$k<@n_prime_factors;$k++) {
    $prime_factorial_n *= $n_prime_factors[$k];
}
#
print $prime_factorial_n,"\n";
my $i = $prime_factorial_n;
while (($i>0) && ($i<$factorial_n)) {
    my $times=0;
    for (my $j=2;$j<=$n;$j++) {
        if ($i % $j == 0) {$times++;}
        else {last;}
    }
    print $times,"\n";
    if ($times == ($n-1)) {print $i,"\n";last;}
    $i = $i + $prime_factorial_n;
    #print $i,"\n";
} 
