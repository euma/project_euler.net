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
#my @p=prime_number_list($k);
my @p=prime_number_list($k*2);
my @p_temp;
for (my $j=0;$j<@p;$j++) {
    push(@p_temp,$p[$j]);
}
#print join(" -- ",@p),"\n";#ok!
my @a;
for (my $j=0;$j<@p;$j++) {
    push(@a,1);
}
#print join(" -- ",@a),"\n";#ok!
#
my $i=0;
#while ( $p_temp[$i] <= $k ) {#not work!#this is my wrong, not computer wrong. Because when I choose @p=prime_number_list($k) then $p_temp[$i] <= $k is alse true and $p_temp($n) for $n > $#p is undefined!so infinite loop is made by me!
#one sovltion is :
#my @p=prime_number_list($k*2);
#then @p_temp[$i] <= $k can become false when $i>$#p!

while ( (($p_temp[$i] <=> $k) == -1) || (($p_temp[$i] <=> $k) == 0)) {#not work!
    #print $p_temp[$i] <= $k,"\n";
    #if (!defined($p_temp[$i])){print "p_temp[$i] not define!\n";last;}
    #print "i=",$i,"\n";
    if ($check) {
        if ($p_temp[$i] <= $limit) {
            $a[$i] = floor(log($k) / log($p_temp[$i]));
        } else {
            $check = 0;
        }
    }
    $N *= ($p_temp[$i] ** $a[$i]);
    $i++;
}
print $N,"\n"; 
