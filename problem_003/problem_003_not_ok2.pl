$number=600851475143;
#print $number,"\n";#ok!
@is_prime;
for ($i=0;$i<=$number;$i++) {
    push(@is_prime,1);
}
#print join(" -- ",@is_prime),"\n";
for ($i=2;$i*$i<=$number;$i++) {
    if ($is_prime[$i]) {
        for ($j=$i;$i*$j<=$number;$j++) {
            $is_prime[$i*$j]=0;
        }
    }
}
for ($i=$number;$i>=2;$i--) {
    if ($is_prime[$i]) {
        if ($number % $i == 0) {
            print "we find the largest prime factor of the number $number is $i\n";last;}
    }
}
