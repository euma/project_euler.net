#n=”the evil big number”
#$n=$ARGV[0];
$n=2*1009;
if ($n % 2 == 0) {
    $n=$n / 2;
    $lastFactor=2;
    while ($n % 2 == 0) {
        $n=$n / 2
    }
} else {
    $lastFactor=1;
}
$factor=3;
while ($n>1) {
    if ($n % $factor == 0) {
        $n=$n / $factor;
        $lastFactor=$factor;
        while ($n % $factor == 0) {
            $n=$n / $factor;
        }
    }
    $factor=$factor+2;
}
#output lastFactor
print $lastFactor,"\n";
