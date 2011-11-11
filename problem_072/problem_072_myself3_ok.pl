use strict;
use warnings;

#the lengths of Farey sequence |Fn| have relationship:
#|Fn|=|Fn-1|+totient(n)
#|F1|=2
#|Fn|=1+sum_(m=(1..n))(totient(m));

#first generate totient(m)

#generate prime array
my $target=$ARGV[0];
my $sievebound = int(($target-1) / 2);
my @sieve=();
foreach (0 .. $sievebound) {
  push(@sieve,0);
}
my $crosstarget = int((int(sqrt($target)) -1) / 2);
for (my $i=1;$i<=$crosstarget;$i++) {
  if (not $sieve[$i]) {
    for (my $j=2*$i*($i+1);$j<=$sievebound;$j += (2*$i+1)) {
      $sieve[$j] = 1;
    }
  }
}
#for (my $i = 1;$i<=$sievebound;$i++) {
#  if (not $sieve[$i]) {
#    print "$i: ";
#    print 2*$i+1,"\n";
#  }
#}
print "\ncreate prime array is ok!\n";
#my @totient_arr=(0,1);
#for (my $i=2;$i<=$target;$i++) {
#  if ($is_prime[$i]) {
#    $totient_arr[$i]=$i-1;
#  }
#}
my @totient_arr=(0,1,1);#totient(0)=0,totient(1)=1,totient(2)=1;
for (my $i = 1;$i<=$sievebound;$i++) {
  if (not $sieve[$i]) {
    my $prime=2*$i+1;
    $totient_arr[$prime]=$prime-1;
  }
}
print "\ncreate prime totient is ok!\n";
for (my $i=2;$i*$i<=$target;$i++) {
  if (defined($totient_arr[$i])) {
    for (my $j=$i;$i*$j<=$target;$j++) {
      if ((not defined($totient_arr[$i*$j])) and defined($totient_arr[$j])) {
	my $i_is_prime=0;
	my $j_is_prime=0;
	if ($i == 2) {
	  $i_is_prime=1;
	} elsif ($i % 2 !=0 and (not $sieve[($i-1)/2])) {
	  $i_is_prime=1;
	} elsif ($j == 2) {
	  $j_is_prime=1;
	} elsif ($j % 2 !=0 and (not $sieve[($j-1)/2])) {
	  $j_is_prime=1;
	}
	my $non_prime=0;
	my $prime=0;
	if ($i_is_prime) {
	  $non_prime=$j;
	  $prime=$i;
	}
	if ($j_is_prime) {
	  $non_prime=$i;
	  $prime=$j;
	}
	if ($i_is_prime or $j_is_prime) {
	  if ($non_prime % $prime == 0) {
	    $totient_arr[$prime*$non_prime]=$prime*$totient_arr[$non_prime];
	  } else {
	    $totient_arr[$prime*$non_prime]=($prime-1)*$totient_arr[$non_prime];
	  }
	}
      }
    }
  }
}
#for (my $i=0;$i<=$#totient_arr;$i++)
#{
#  if (!defined($totient_arr[$i])) { print "($i)"; }
#}
#print "\n";

print "\ncreate integer totient is ok!\n";
my $sum_totient=0;
for (my $i=1;$i<=$#totient_arr;$i++)
{
  $sum_totient+=$totient_arr[$i];
}
#print "\n$sum_totient\n";
my $farey_sequence_length=$sum_totient+1;
print "\n$farey_sequence_length\n";
my $answer=$farey_sequence_length-2;
print "\n$answer\n";
