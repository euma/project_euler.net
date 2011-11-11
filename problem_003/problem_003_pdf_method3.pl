#n=”the evil big number”
$n=$ARGV[0];
if ($n % 2==0) {
    $lastFactor=2;
    $n=$n / 2;
    while ($n % 2==0) {
        $n=$n / 2;
    }
} else {
    $lastFactor=1;
}
$factor=3;
$maxFactor= int(sqrt($n));
while ($n>1 && $factor<=$maxFactor) {
    if ($n % $factor==0) {
        $n=$n / $factor;
        $lastFactor=$factor;
        while ($n % $factor==0) {
            $n=$n / $factor;
        }
        $maxFactor= int(sqrt($n));
    }
    $factor=$factor+2;
}
if ($n==1) {
    print $lastFactor,"\n";
} else {
    print $n,"\n";
}
