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
$a = 100;
while ($a <= 999) {
    $b = $a;
    while ($b <= 999) {
        if (isPalindrome($a*$b) and ($a*$b > $largestPalindrome)) {
            $largestPalindrome = $a*$b;
        }
        $b = $b+1;
    }
    $a = $a+1;
}
print $largestPalindrome,"\n";
