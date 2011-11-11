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
print "$limit\n";
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
	my $catprime=$iprime.$jprime;
	if (is_prime($catprime)) {
	  push(@iprime_cat,$jprime);
	  #print "$iprime $jprime $catprime\n";
	}
#	else
#	{
#	  #print "$iprime $jprime $catprime(not)\n";
#	}
      }
    }
    print "$iprime\n";
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
  #print "$i: ";
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
print "\n-----------------part 2---------------\n";
my %cat_prime3=();
sub k_in_i
{
  my $k=shift;
  my $i=shift;
  foreach my $j (@{$cat_prime2{$i}})
  {
    if ($j == $k) {
      return 1;
    }
  }
  return 0;
}

foreach my $i (keys %cat_prime2)
{
  my @iprime_cat3=();
  foreach my $j (@{$cat_prime2{$i}})
  {
    my $can_push=0;
    foreach my $k (@{$cat_prime2{$j}})
    {
      #there $k must in $i
      if ($k != $i and k_in_i($k,$i))
      {
	foreach my $l (@{$cat_prime2{$k}})
	{
	  if ($l == $i)
	  {
            $can_push=1;
	  }
	}
      }
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
sub k_in_i2
{
  my $k=shift;
  my $i=shift;
  foreach my $j (@{$cat_prime3{$i}})
  {
    if ($j == $k) {
      return 1;
    }
  }
  return 0;
}
my %cat_prime4=();
foreach my $i (keys %cat_prime3)
{
  my @iprime_cat4=();
  foreach my $j (@{$cat_prime3{$i}})
  {
    my $can_push=0;
    loop3:
    foreach my $k (@{$cat_prime3{$j}})
    {
      if ($k != $i and k_in_i2($k,$i))
      {
	foreach my $l (@{$cat_prime3{$k}})
	{
	  if ($l != $i and $l != $j and k_in_i2($l,$j) and k_in_i2($l,$i))
	  {
	    foreach my $m (@{$cat_prime3{$l}})
	    {
	      if ($m == $i)
	      {
                $can_push=1;
		last loop3;
	      }
	    }
	  }
	}
      }
    }
    if ($can_push)
    {
      push(@iprime_cat4,$j);
    }
  }
  if (@iprime_cat4)
  {
    $cat_prime4{$i}=\@iprime_cat4;
  }
  #print "\n";
}
print "\n-------------------------part 4-----------------\n";
sub k_in_i3
{
  my $k=shift;
  my $i=shift;
  foreach my $j (@{$cat_prime4{$i}})
  {
    if ($j == $k) {
      return 1;
    }
  }
  return 0;
}
my %cat_prime5=();
my $min_sum=$limit*5;
my $min_i=0;
my $min_j=0;
my $min_k=0;
my $min_l=0;
my $min_m=0;
foreach my $i (keys %cat_prime4)
{
  print "$i: ";
  my @iprime_cat5=();
  foreach my $j (@{$cat_prime4{$i}})
  {
    my $can_push=0;
    loop4:
    foreach my $k (@{$cat_prime4{$j}})
    {
      if ($k != $i and k_in_i3($k,$i))
      {
	foreach my $l (@{$cat_prime4{$k}})
	{
	  if ($l != $i and $l != $j and k_in_i3($l,$j) and k_in_i3($l,$i))
	  {
	    foreach my $m (@{$cat_prime4{$l}})
	    {
	      if ($m != $i and $m != $j and $m != $k and k_in_i3($m,$i) and k_in_i3($m,$j) and k_in_i3($m,$k))
	      {
		foreach my $n (@{$cat_prime4{$m}})
		{
		  if ($n == $i)
		  {
		    my $local_sum=$i+$j+$k+$l+$m;
		    if ($local_sum < $min_sum)
		    {
		      $min_sum = $local_sum;
		      $min_i=$i;
		      $min_j=$j;
		      $min_k=$k;
		      $min_l=$l;
		      $min_m=$m;
		    }
		    $can_push=1;
		    last loop4;
		  }
		}
	      }
	    }
	  }
	}
      }
    }
    if ($can_push)
    {
      push(@iprime_cat5,$j);
    }
  }
  if (@iprime_cat5)
  {
    $cat_prime5{$i}=\@iprime_cat5;
  }
  print "\n";
}
print "\n-------------------------part 5-----------------\n";
foreach my $k (keys %cat_prime5)
{
  print "$k: ";
  foreach (@{$cat_prime5{$k}})
  {
    print "$_ ";
  }
  print "\n";
}
print "\n$min_sum\n";
print "\n$min_i $min_j $min_k $min_l $min_m\n";
