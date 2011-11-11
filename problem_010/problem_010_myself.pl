use strict;
use warnings;
print "\nEnter Max n: ";
my $N=$ARGV[0];
my @is_prime;
for (my $i=0;$i<=$N;$i++) {
  push(@is_prime,1);
}
#print join(" -- ",@is_prime),"\n";
my $test=0;
for (my $i=2;$i*$i<=$N;$i++) {
  if ($is_prime[$i]) {
    for (my $j=$i;$i*$j<=$N;$j++) {
      $is_prime[$i*$j]=0;
    }
  } else {
    $test++;
  }
}
print "less than or equalto $N 's prime number is:$test?\n";
my $prime_sum=0;
my $prime_number=0;
for (my $i=2;$i<$N;$i++) {
  if ($is_prime[$i]) {
    $prime_number++;
    $prime_sum += $i;
  }
}
print "less than or equalto $N 's prime number is:$prime_number.\n";
print $prime_sum,"\n";

