#I want to find $test and $prime_number's relationship
use strict;
use warnings;
my $N=$ARGV[0];
my $M=$ARGV[1];
for (my $k=1;$k<$N;$k += $M) {
  my @is_prime;
  for (my $i=0;$i<=$k;$i++) {
    $is_prime[$i]=1;
  }
  #print join(" -- ",@is_prime),"\n";
  my $test=0;
  for (my $i=2;$i*$i<=$k;$i++) {
    if ($is_prime[$i]) {
      for (my $j=$i;$i*$j<=$k;$j++) {
        $is_prime[$i*$j]=0;
      }
    } else {
      $test++;
    }
  }
  my $prime_number=0;
  for (my $i=2;$i<$k;$i++) {
    if ($is_prime[$i]) {
      $prime_number++;
    }
  }
  #print "less than or equalto $k 's prime number is:$test?\n";
  #print "less than or equalto $k 's prime number is:$prime_number.\n";
  if ($test > 0) {print $prime_number/$test/$k,"\n";}
}
