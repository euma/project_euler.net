use strict;
use warnings;

my $target=$ARGV[0];
my @prime_list=();
my @is_prime=();
for (my $i=0;$i<=$target;$i++) {
  $is_prime[$i]=1;
}
for (my $i=2;$i*$i<=$target;$i++) {
    if ($is_prime[$i]) {
        for (my $j=$i;$i*$j<=$target;$j++) {
            $is_prime[$i*$j]=0;
        }   
    }   
}
for (my $i=2;$i<=$target;$i++) {
    if ($is_prime[$i]) {push(@prime_list,$i);}
}
print "$target: ";
print join(" -- ",@prime_list);
print "\n";
my $number=$ARGV[1];
print "$number: ";

my $numerator=1;
my $denominator=1;
for (my $i=2;$i<$number;$i++) {
  if ($is_prime[$i]) {
    my $first=1;
    while ($number % $i == 0) {
      if ($first) {
	print "$i ";
	$numerator *= ($i-1);
	$denominator *= $i;
	$first=0;
      }
      $number /= $i;
    }
  }
}
if ($number > 1) {
  $numerator *= ($number-1);
  $denominator *= $number;
}
my $n_totient=$denominator/$numerator;
print "\n$n_totient\n";
