use strict;
use warnings;
use bignum;

my $n=$ARGV[0];
my @S=(1 .. $n-1);
my $m=$#S;
#initialize table with base cases
my %table=();

for (my $i=0;$i<=$n;$i++) {
	for (my $j=0;$j<=$m;$j++) {
		my $n1=$i-$S[$j];
		my $m1=$j;
		my $n2=$i;
		my $m2=$j-1;

		if ($n1 == 0) { $table{$n1}{$m1}=1; }
		elsif ($n1 < 0) { $table{$n1}{$m1}=0; }
		elsif ($m1 < 0 and $n1 >= 1) { $table{$n1}{$m1}=0; }

		if ($n2 == 0) { $table{$n2}{$m2}=1; }
		elsif ($n2 < 0) { $table{$n2}{$m2}=0; }
		elsif ($m2 < 0 and $n2 >= 1) { $table{$n2}{$m2}=0; }

		$table{$i}{$j} = $table{$n1}{$m1} + $table{$n2}{$m2};
		if ($j==$i-1) { print "$i: $table{$i}{$j}\n"; }
		if ($i%1000000==0) { print "\nfind!\n";last; }
	}
}
print $table{$n}{$m}+1;
print "\n";
