use strict;
use warnings;
#my $s = 1000; # or whatever the perimeter should be
my $s = $ARGV[0]; # or whatever the perimeter should be
for (my $a = 3; $a < ($s-3)/3; $a++) {
	for (my $b = ($a+1); $b < ($s-1-$a)/2; $b++) {
		my $c = $s - $a - $b;
		if ($c*$c == $a*$a + $b*$b) {
			print "($a,$b,$c)\n";
		}
	}
}
#perl problem_009_pdf_method1.pl 1000
#(200,375,425)
