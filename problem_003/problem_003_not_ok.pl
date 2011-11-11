$number=600851475143; 
#$number=$ARGV[0]; 
$max=int(sqrt($number));
#print $max,"\n";#ok!
if ($max<2) {print "there don't exsit prime list.\n";exit;}
@prime_list=();#for $number=600851475143; @prime_list is too large!
for ($n=$max;$n>1;$n--) {
    #print $n," -- ";
    $is_prime=1;
    for($i=2;$i<=sqrt($n);$i++) {
        if ($n % $i == 0) {
            $is_prime = 0; last;
        }
    }
    if ($is_prime == 1) {
        print $n," -- ";
        push(@prime_list,$n);
    }
}
print join(" -- ",@prime_list),"\n";
#foreach my $prime (@prime_list) {
#}
