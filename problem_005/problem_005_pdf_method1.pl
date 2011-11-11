use POSIX;
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
my $k = 20;
my $N = 1;
my $check = 1;
my $limit = sqrt($k);
our @p=prime_number_list($k);
#print join(" -- ",@p),"\n";#ok!
my @a;
for (my $j=0;$j<@p;$j++) {
    push(@a,1);
}
#print join(" -- ",@a),"\n";#ok!
#
#while ( $p[$i] <= $k ) {#not work!
for (my $i = 0;$i<@p;$i++) {
    if ($check) {
        if ($p[$i] <= $limit) {
            $a[$i] = floor(log($k) / log($p[$i]));
        } else {
            $check = 0;
        }
    }
    $N *= ($p[$i] ** $a[$i]);
}
print $N,"\n"; 
