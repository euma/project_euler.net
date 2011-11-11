use strict;
use warnings;

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
my $total_prime=0;
for (my $i=1;$i<=$max;$i++)
{
  ########################
  if (!(defined($composite4{$i}) and $composite4{$i}))
  {
    #print 4*$i*$i-2*$i+1; print "\n";
    $total_prime++;
  }
  ########################
  if (!(defined($composite3{$i}) and $composite3{$i}))
  {
    #print 4*$i*$i+1; print "\n";
    $total_prime++;
  }
  ######################
  if (!(defined($composite2{$i}) and $composite2{$i}))
  {
    #print 4*$i*$i+2*$i+1; print "\n";
    $total_prime++;
  }
  my $total_all=4*$i+1;
  my $spiral_size=2*$i+1;
  print "$spiral_size: $total_prime/$total_all = ";
  print $total_prime/$total_all;
  print "\n";
}
