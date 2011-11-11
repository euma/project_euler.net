use bigint;
my $a = 0; my $b = 1;
if (@ARGV != 1) {
    print "Enter on paramter!\n";
    exit 1;
}
my $max_a = $ARGV[0];
my $even_fib_sum=0;
for ($i=0;$a<$max_a;$i++){
    #printf "%d\n", $a;
    if ($a%2 == 0) {$even_fib_sum +=$a;}
    $ab_sum = $a + $b;
    $a = $b;
    $b = $ab_sum;
}
print $even_fib_sum,"\n";
