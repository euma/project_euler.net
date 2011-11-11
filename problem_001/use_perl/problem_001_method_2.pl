use strict;
use warnings;
use Time::HiRes qw(gettimeofday tv_interval);
if (@ARGV != 1) {
    print "Enter one paramter\n";
    exit 1;
} 
open FILE, ">problem1_method2.txt" or die $!;
my $t0 = [gettimeofday];
my $number_big=$ARGV[0];
if ($ARGV[0]>7) { use bigint; }
sub sum_divisible_by {
    my($argument1,$argument2)=@_;
    my $p = int($argument2/$argument1);
    return $argument1*($p*($p+1))/2;
}
for (my $i=1;$i<$number_big;$i++) {
    my $big_number=10**$i-1; 
    my $sum= sum_divisible_by(3,$big_number) + sum_divisible_by(5,$big_number) - sum_divisible_by(15,$big_number); 
    print FILE "for target is:$big_number\n";
    print FILE "sum is:$sum\n";
    my $elapsed = tv_interval ($t0); 
    print FILE "using time is:$elapsed\n";
}
close FILE or die $!;
