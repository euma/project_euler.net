use strict;
use warnings;

sub is_prime {
    my $n=shift;
    if ($n <= 1) { return 0; }
    elsif ($n < 4) { return 1; } #2 and 3 are prime
    elsif ($n % 2 == 0) { return 0; }
    elsif ($n < 9) { return 1; } # 5 and 7 are prime and we have already excluded 4,6 and 8.
    elsif ($n % 3 == 0) { return 0; }
    else {
        my $r=int(sqrt($n)); # sqrt(n) rounded to the greatest integer r so that r*r<=n
        #All primes greater than 3 can be written in the form 6k+/-1.
        #so k=1 p=5 or 7;
        #   k=2 p=11 or 13;
        #   k=3 p=17 or 19;
        #   k=4 p=23 or 25;
        my $f=5;
        while ($f<=$r) {
            if ($n % $f == 0) { return 0; }
            if (($n % ($f+2)) == 0) { return 0; }
            $f = $f + 6;
        }
        return 1;
    }
}

my $limit=$ARGV[0];
my $sievebound = int(($limit-1) / 2);
my @sieve=();
foreach (0 .. $sievebound) {
  push(@sieve,0);
}
my $crosslimit = int((int(sqrt($limit)) -1) / 2);
for (my $i=1;$i<=$crosslimit;$i++) {
  if (not $sieve[$i]) {
    for (my $j=2*$i*($i+1);$j<=$sievebound;$j += (2*$i+1)) {
      $sieve[$j] = 1;
    }
  }
}
my %cat_prime=();
for (my $i = 1;$i<=$sievebound;$i++)
{
  if (not $sieve[$i])
  {
    my $iprime= 2*$i+1;
    my @iprime_cat=();
    for (my $j = 1;$j<=$sievebound;$j++)
    {
      if (not $sieve[$j])
      {
        my $jprime= 2*$j+1;
	my $lcatprime=$iprime.$jprime;
	my $rcatprime=$jprime.$iprime;
	if (is_prime($lcatprime) and is_prime($rcatprime)) {
	  push(@iprime_cat,$jprime);
	  #print "$iprime $jprime $catprime\n";
	}
#	else
#	{
#	  #print "$iprime $jprime $catprime(not)\n";
#	}
      }
    }
    if (@iprime_cat)
    {
      $cat_prime{$iprime}=\@iprime_cat;
    }
  }
}
print "\n---------------part 1----------------\n";
my %cat_prime2=();
foreach my $i (keys %cat_prime)
{
  print "$i: ";
  my @iprime_cat2=();
  foreach my $j (@{$cat_prime{$i}})
  {
    if(defined($cat_prime{$j}))
    {
      foreach my $k (@{$cat_prime{$j}})
      {
	if ($i == $k)
	{
	  push(@iprime_cat2,$j);
	  #print "$j ";
	}
      }
    }
  }
  if (@iprime_cat2)
  {
    $cat_prime2{$i}=\@iprime_cat2;
  }
  #print "\n";
}
print "-----------------part 2\n---------------\n";
my $min_sum=$limit**3;
my $min_i=0;
my $min_j=0;
my $min_k=0;
my %cat_prime3=();
my %ijtest=();
foreach my $i (keys %cat_prime2)
{
  my @iprime_cat3=();
  foreach my $j (@{$cat_prime2{$i}})
  {
    my $can_push=0;
    my @ijk=();
    foreach my $k (@{$cat_prime2{$j}})
    {
      if ($k != $i)
      {
	foreach my $l (@{$cat_prime2{$k}})
	{
	  if ($l == $i)
	  {
	    push(@ijk,$k);
	    my $local_sum=$i+$j+$k;
	    if ($local_sum < $min_sum)
	    {
	      $min_sum = $local_sum;
	      $min_i=$i;
	      $min_j=$j;
	      $min_k=$k;
	    }
            $can_push=1;
	    #print "$j ";
	  }
	}
      }
    }
    if (@ijk)
    {
      $ijtest{$i}{$j}=\@ijk;
    }
    if ($can_push)
    {
      push(@iprime_cat3,$j);
    }
  }
  if (@iprime_cat3)
  {
    $cat_prime3{$i}=\@iprime_cat3;
  }
  #print "\n";
}
print "\n-------------------------part 3-----------------\n";
foreach my $k (keys %cat_prime3)
{
  print "$k: ";
  foreach (@{$cat_prime3{$k}})
  {
    print "$_ ";
  }
  print "\n";
}
print "\n$min_sum\n";
print "\n$min_i $min_j $min_k\n";

for my $i (keys %ijtest) {
  for my $j (keys %{ $ijtest{$i}}) {
    print "$i - $j --- ";
    print @{$ijtest{$i}{$j}};
    print "\n";
  }
  print "\n";
}

