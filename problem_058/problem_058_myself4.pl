use strict;
use warnings;

#1Sn=(2n+1)**2 always is composite number
#2Sn=(2n+1)**2-2n
#   =4nn+2n+1
#if 2Sn=pq,then n=(sqrt(4pq-3)-1)/4,there n must be positive integer!
#3Sn=(2n+1)**2-4n
#   =4nn+1
#if 3Sn=pq,then n=sqrt(pq-1)/2,there n must be positive integer!
#4Sn=(2n+1)**2-6n
#   =4nn-2n+1
#if 4Sn=pq,then n=(sqrt(4pq-3)+1)/4,there n must be positive integer!
my $max=$ARGV[0];
my %composite2=();
my %composite3=();
my %composite4=();
my $limit=4*$max*$max+4*$max+1;#$p*$q=$max;
for (my $p=3;$p<=$limit/3;$p+=2)
{
  for (my $q=$p;$q<=$limit/$p;$q+=2)
  {
    my $num2=(sqrt(4*$p*$q-3)-1)/4;
    if ($num2 == int($num2)) {
      $composite2{$num2}=1;
    }
    my $num3=sqrt($p*$q-1)/2;
    if ($num3 == int($num3)) {
      $composite3{$num3}=1;
    }
    my $num4=(sqrt(4*$p*$q-3)+1)/4;
    if ($num4 == int($num4)) {
      $composite4{$num4}=1;
    }
  }
}
for (my $i=1;$i<=$max;$i++)
{
  ########################
  if (defined($composite4{$i}) and $composite4{$i})
  {
    print 4*$i*$i-2*$i+1; print "\n";
  }
  else
  {
    print 4*$i*$i-2*$i+1; print "(prime)\n";
  }

  ########################
  if (defined($composite3{$i}) and $composite3{$i})
  {
    print 4*$i*$i+1; print "\n";
  }
  else
  {
    print 4*$i*$i+1; print "(prime)\n";
  }
  ######################
  if (defined($composite2{$i}) and $composite2{$i})
  {
    print 4*$i*$i+2*$i+1; print "\n";
  }
  else
  {
    print 4*$i*$i+2*$i+1; print "(prime)\n";
  }
}
