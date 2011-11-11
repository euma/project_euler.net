$max=0;
for ($i=999;$i>0;$i--) {
    for ($j=999;$j>0;$j--) {
        my $number=$i*$j;
        if ($number==reverse($number)) {
            if ($number>$max) {
                $max=$number;
                print "$i*$j=$number\n";
            }
            last;
        }
    }
}
print $max,"\n";
