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
print "$target: "; print join(" -- ",@prime_list); print "\n";
#my $number=$ARGV[1];
my $max_n_totient=-1;
my $max_n=0;
for (my $number=2;$number<=$target;$number++) {
  print "$number: ";
  my $number_tmp=$number;
  my $numerator=1;
  my $denominator=1;
  my $i=0;
  while (defined($prime_list[$i]) and $prime_list[$i]<= $number) {
    my $prime=$prime_list[$i];
    my $first=1;
    while ($number_tmp % $prime == 0) {
      if ($first) {
	print "$prime ";
	$numerator *= ($prime-1);
	$denominator *= $prime;
	$first=0;
      }
      $number_tmp /= $prime;
    }
    $i++;
  }
  print "\t";
  my $n_totient=$denominator/$numerator;
  if ($n_totient > $max_n_totient) { $max_n_totient=$n_totient; $max_n=$number; }
  print "$n_totient\n";
}
print "\n$max_n_totient\n";
print "\n$max_n\n";
