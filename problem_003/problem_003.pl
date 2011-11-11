$a=600_851_475_143;
$f = 2;
while ( $a > 1 ) {
    if ($a % $f == 0) { $a /= $f; }
    else { $f += 1; }
}
print $f,"\n";
