my $max=$ARGV[0];
my $a=0;
my $b=0;
my $c=0;
for (my $n=1;$n<$max;$n++) {
	for (my $m=$n+1;$m<$max;$m++) {
		$a=$m*$m-$n*$n;
		$b=2*$m*$n;
		$c=$m*$m+$n*$n;
		if ($a+$b+$c == 1000) {
                  print "$a,$b,$c\n";
                  print "product is ",$a*$b*$c,"\n";
                }
	}
} 
