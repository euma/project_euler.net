use strict;
use warnings;

sub gcd {
  my ($a, $b)=@_;
  while ($b != 0) {
    my $t = $b;
    $b = $a % $b;
    $a = $t;
  }
  return $a;
}

my $target=$ARGV[0];
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
my @totient_arr=(0,1);
for (my $i=2;$i<=$target;$i++) {
  if ($i % 10 == 0) { print "\n"; }
  if ($is_prime[$i]) {
    $totient_arr[$i]=$i-1;
    print "$i ";
  }
}
print "\n";
#\varphi(mn) = \varphi(m)\varphi(n)\cdot\frac{d}{\varphi(d)} where d = gcd(m,n).
#totient(m*n) = totient(m)*totient(n)*d/totient(d) where d = gcd(m,n).
for (my $i=2;$i*$i<=$target;$i++) {
  for (my $j=$i;$i*$j<=$target;$j++) {
    my $d=gcd($i,$j);
    if (defined($totient_arr[$i]) and defined($totient_arr[$j]) and defined($totient_arr[$d])) {
      #$totient_arr[$i*$j]=$totient_arr[$i]*$totient_arr[$j];#this is only for $i and $j is coprime!
      $totient_arr[$i*$j]=$totient_arr[$i]*$totient_arr[$j]*$d/$totient_arr[$d];
    }
    else
    {
      #print "$i $j\n";
    }
  }
}
#print "$target: "; print join(" -- ",@totient_arr); print "\n";
for (my $i=0;$i<=$#totient_arr;$i++)
{
  if ($i % 10 == 0) { print "\n"; }
  if (defined($totient_arr[$i]))
  {
    #print "$i: $totient_arr[$i]  ";
    print "$totient_arr[$i]  ";
  }
  else { print "($i)"; }
}
print "\n";
for (my $i=2;$i<=$#totient_arr;$i++)
{
  my $n_totient=$i/$totient_arr[$i];
  print "$i: $n_totient\n";
}
print "\n";

#my $number=$ARGV[1];
#my $max_n_totient=-1;
#my $max_n=0;
#for (my $number=2;$number<=$target;$number++) {
#  print "$number: ";
#  my $number_tmp=$number;
#  my $numerator=1;
#  my $denominator=1;
#  my $i=0;
#  while (defined($prime_list[$i]) and $prime_list[$i]<= $number) {
#    my $prime=$prime_list[$i];
#    my $first=1;
#    while ($number_tmp % $prime == 0) {
#      if ($first) {
#	print "$prime ";
#	$numerator *= ($prime-1);
#	$denominator *= $prime;
#	$first=0;
#      }
#      $number_tmp /= $prime;
#    }
#    $i++;
#  }
#  print "\t";
#  my $n_totient=$denominator/$numerator;
#  if ($n_totient > $max_n_totient) { $max_n_totient=$n_totient; $max_n=$number; }
#  print "$n_totient\n";
#}
#print "\n$max_n_totient\n";
#print "\n$max_n\n";
