sub reverse {
    $reversed = 0;
    $n=shift;
    while ($n > 0) {
        $reversed = 10*$reversed + $n % 10;
        $n = $n/10;
    }
    return $reversed;
}
sub isPalindrome {
    $n=shift;
    return($n == reverse($n));
}
$largestPalindrome = 0;
$a = 999;
while ($a >= 100) {
    $b = 999;
    while ($b >= $a) {
        if ($a*$b <= $largestPalindrome) { last; }
        if (isPalindrome($a*$b)) {
            $largestPalindrome = $a*$b;
        }
        $b = $b-1;
    }
    $a = $a-1;
}
print $largestPalindrome,"\n";
