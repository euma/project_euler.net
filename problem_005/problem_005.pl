use warnings;
use strict;
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
#print join(" -- ",prime_number_list(10)),"\n";#ok!
my $n=20;
my @n_prime_factors=prime_number_list($n);
#print join(" -- ",@n_prime_factors),"\n";#ok!
my @max_prime_factor_times;
for(my $j=0;$j<@n_prime_factors;$j++) {
    push(@max_prime_factor_times,0);
} 
for (my $i=2; $i<=$n; $i++) { 
    #print $i,"\n";;
    my @i_prime_factor_times;
    for(my $j=0;$j<@n_prime_factors;$j++) {
        push(@i_prime_factor_times,0);
    }
    #print join(" -- ",@i_prime_factor_times),"\n";#ok!
    my $temp_i=$i;
    for(my $j=0;$j<@n_prime_factors;$j++) {
        if ($n_prime_factors[$j] <= $i) {
            while ($temp_i % $n_prime_factors[$j] == 0) {
                $i_prime_factor_times[$j] ++;
                $temp_i /= $n_prime_factors[$j];
            }
        } else {
            last;
        }
    }
#    print "$i = ";
#    for (my $k=0;$k<@n_prime_factors;$k++) {
#        print "(";
#        print $n_prime_factors[$k];
#        #print "**";
#        print "^";
#        print $i_prime_factor_times[$k];
#        print ")";
#    }
#    print "\n";
    for (my $k=0;$k<@n_prime_factors;$k++) {
        if ($i_prime_factor_times[$k] > $max_prime_factor_times[$k]) {
            $max_prime_factor_times[$k] = $i_prime_factor_times[$k];
        }
    }
}
print join(" -- ",@max_prime_factor_times),"\n";#ok!
my $products=1;
for(my $i=0;$i<@n_prime_factors;$i++) {
    $products *= ($n_prime_factors[$i]**$max_prime_factor_times[$i]);
}
print $products,"\n";
