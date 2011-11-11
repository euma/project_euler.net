use warnings;
use strict;
my $n=20;
#my $n=10;#ok!
#my $i=$n;
my $i=232792000;
my $factorial_n=1;
for(my $k=2;$k<=$n;$k++) {
    $factorial_n*=$k;
}
while ($i>($n-1) && $i<$factorial_n) {
    my $times=0;
    for (my $j=2;$j<=$n;$j++) {
        if ($i % $j == 0) {$times++;}
        else {last;}
    }
    #print $times,"\n";
    if ($times == ($n-1)) {print $i,"\n";last;}
    #$i = $i + $n;
    $i++;
    print $i,"\n";
} 
