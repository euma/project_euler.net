#totient(n)=(p1-1)*(p2-1)*...*(pr-1)/(p1*p2*...*pr)
sub factor1 {
  return @_  if  $_[0] !~ /^(..+?)\1+$/;
  return map { factor1($_) }
  ( "$1", $_[0] =~ s/$1/1/g, $_[0] )[0,-1];
}
sub factor10 {
  return map {length} factor1( 1x$_[0] );
}
my $target=$ARGV[0];
my @prime_factors=factor10($target);
my @prime_factors_distinct=();
my %seen=();
for (my $i=0;$i<=$#prime_factors;$i++)
{
  if (not $seen{$i})
  {
    #print "$prime_factors[$i] ";
    push(@prime_factors_distinct, $prime_factors[$i]);
    for (my $j=$i+1;$j<=$#prime_factors;$j++)
    {   
      if ($prime_factors[$i] == $prime_factors[$j])
      {   
        $seen{$j}=1;
      }   
    }   
  }
}
my $numerator=1;
my $denominator=1;
for (my $i=0;$i<=$#prime_factors_distinct;$i++)
{
  print "$prime_factors_distinct[$i] ";
  $numerator *= ($prime_factors_distinct[$i]-1);
  $denominator *= $prime_factors_distinct[$i];
}
print "\n";
#my $totient=$target*$numerator/$denominator;
my $n_totient=$denominator/$numerator;
print "\n$n_totient\n";
