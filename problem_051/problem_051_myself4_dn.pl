use strict;
use warnings;

#121313 -- 222323 -- 323333 -- 424343 -- 525353 -- 626363 -- 828383 -- 929393 -- (8)

#121313

#real	0m37.787s
#user	0m29.006s
#sys	0m1.684s

my $digit=$ARGV[0];
if ($digit < 3) {
  print "$digit is less than 3;\n";
  print "This programm need command paramter >=3!\n";
  exit 1;
}
#part 1 to generate prime array
my $limit=10**$digit-1;
#print "$limit\n";
my $sievebound = int(($limit-1) / 2);# last index of sieve
#print "$sievebound\n";
#sieve := new boolean array [1 .. sievebound] false
my @sieve=();
foreach (0 .. $sievebound) {
  push(@sieve,0);
}
#for (my $i=0;$i<=$#sieve;$i++) {
#  print "$i:$sieve[$i]\n";
#}
my $crosslimit = int((int(sqrt($limit)) -1) / 2);
#print "$crosslimit\n";
for (my $i=1;$i<=$crosslimit;$i++) {
  if (not $sieve[$i]) { #2*i+1 is prime, mark multiples
    for (my $j=2*$i*($i+1);$j<=$sievebound;$j += (2*$i+1)) {
      $sieve[$j] = 1;
    }
  }
}

#part 2 get combination
sub combination_array {
  my $comb=shift;
  my $k=shift;
  my @arr=();
  for (my $i = 0; $i < $k; ++$i) {
    push(@arr, $comb->[$i]);
  }
  return @arr;
}
sub next_comb {
  my $comb=shift;
  my $k=shift;
  my $n=shift;
  my $i = $k - 1;
  ++$comb->[$i];
  while (($i >= 0) and ($comb->[$i] >= $n - $k + 1 + $i)) {
    --$i;
    ++$comb->[$i];
  }
  if ($comb->[0] > $n - $k) {
    return 0;
  }
  for ($i = $i + 1; $i < $k; ++$i) {
    $comb->[$i] = $comb->[$i - 1] + 1;
  }

  return 1;
}

#my $n=2; my $k=1;

my $start=10**($digit-1)+1;
my $start_index=($start-1)/2;
my $n=$digit;
for (my $k=2;$k<$n;$k++) {
  if ($k > $n) {
    print "combination don't exist!\n";
    return 1;
  }
  my @comb=();
  for (my $i = 0; $i < $k; ++$i) {
    $comb[$i] = $i;
  }
  my @combination_arr_arr=();
  push(@combination_arr_arr,[combination_array(\@comb, $k)]);
  
  while (next_comb(\@comb, $k, $n)) {
    push(@combination_arr_arr,[combination_array(\@comb, $k)]);
  }
  for my $i (0 .. $#combination_arr_arr) {
    my $ref=$combination_arr_arr[$i];
    for (my $n = $start_index;$n<=$sievebound;$n++) {
      if (not $sieve[$n]) {
        my $prime=2*$n+1;
	print "$prime\n";
        my @split_prime=split("",$prime);
	my $same="";
	my $first_same=1;
	my $pass=1;
        for my $j (0 .. $#{$ref}) {
          for (my $k=0;$k<=$#split_prime;$k++) {
            if ($k == $combination_arr_arr[$i][$j]) {
	      if ($first_same) {
		$same=$split_prime[$k];
		$first_same=0;
	      } else {
		if ($same!=$split_prime[$k]) {
		  $pass=0;
		}
	      }
            }
          }
        }
	if ( $pass ) {
          my $count=0;
          my $first=1;
  	  my $first_prime=0;
          for (my $h=0;$h<=9;$h++) {
            for my $j (0 .. $#{$ref}) {
              for (my $k=0;$k<=$#split_prime;$k++) {
                if ($k == $combination_arr_arr[$i][$j]) {
      	        $split_prime[$k]=$h;
                }
              }
            }
    	    my $new_prime=join("",@split_prime);
    	    if (length($new_prime) == length(int($new_prime))) {
    	      if ($new_prime == 2 or ($new_prime > 1 and $new_prime %2 !=0 and (not $sieve[($new_prime-1)/2]))) {
  	        if ($first) {
  	          $first_prime=$new_prime;
  		  $first=0;
  	        }
  	        print "$new_prime -- ";
    	        $count++;
    	      }
    	    }
          }
	  print "($count)\n";
	  if ($count == 8) { print "\n$first_prime\n";exit 0; }
	}
      }
    }
  }
}
