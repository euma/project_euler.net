use strict;
use warnings;
my $N=$ARGV[0];
my @is_prime;
for (my $i=0;$i<=$N;$i++) {
    push(@is_prime,1);
}
#print join(" -- ",@is_prime),"\n";
for (my $i=2;$i*$i<=$N;$i++) {
    if ($is_prime[$i]) {
        for (my $j=$i;$i*$j<=$N;$j++) {
            $is_prime[$i*$j]=0;
        }
    }
}
#my @prime_list;
#for (my $i=2;$i<=$N;$i++) {
#    if ($is_prime[$i]) {push(@prime_list,$i);}
#}
#print join(" -- ",@prime_list),"\n";
my $prime_index=0;
for (my $i=2;$i<=$N;$i++) {
    if ($is_prime[$i]) {
        $prime_index++;
        if ($prime_index == 10001) {print $i,"\n";}
    }
} 
