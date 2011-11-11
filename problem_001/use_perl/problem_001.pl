#Problem 1. Find the sum of all the multiples of 3 or 5 below 1000.
use strict;
use warnings;
use Time::HiRes qw(gettimeofday tv_interval);
if (@ARGV != 1) {
    print "Enter one paramter\n";
    exit 1;
}
open FILE, ">problem1.txt" or die $!;
my $t0 = [gettimeofday];
my $number_big=$ARGV[0];
if ($ARGV[0]>7) { use bigint; }
for (my $i=1;$i<$number_big;$i++) {
    my $sum=0;
    my $big_number=10**$i;
    for (my $j=1;$j<$big_number;$j++) {
        if ($j%3 == 0 || $j%5 == 0) {
            $sum += $j;
        }
    }
    print FILE "for target is:$big_number\n";
    print FILE "sum is:$sum\n";
    my $elapsed = tv_interval ($t0);
    print FILE "using time is:$elapsed\n";
}
close FILE or die $!;
