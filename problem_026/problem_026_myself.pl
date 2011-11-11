use strict;
use warnings;
sub repeated_length {
  #there let
  #num stands for numberator
  #den stands for denominator
  #quo stands for quotient
  #rem stands for remainder
  my $num = shift;
  my $den = shift;
  my $rem=0;
  $num = $num*10;
  
  my @rem_first_come;
  my @rem_second_come;
  my @rem_count;
  foreach (0 .. $den-1) {
    push(@rem_first_come,0);
    push(@rem_second_come,0);
    push(@rem_count,0);
  }
  
  my $target=0;
  my $index=0;
  my $stop=0;
  while (1) {
    $rem=$num % $den;
    $num=$rem*10;
    if (not $rem_first_come[$rem]) {
      $rem_first_come[$rem]=1;
    } elsif ($rem_first_come[$rem] and not $rem_second_come[$rem]) {
      $rem_second_come[$rem]=1;
    }
    if ($rem == 0) { last; }
    if ($rem_second_come[$rem]) {
      $target=$rem;
      last;
    }
    for (my $i=0;$i<$den;$i++) {
      if ($rem_first_come[$i]) {
        $rem_count[$i]++;
      }
    }
  }
  return $rem_count[$target];
}
my $n=1000;
#my $n=20;
my $max_repeated_length=0;
my $max_repeated_length_den=0;
for (my $i=2;$i<$n;$i++) {
  my $repeated_length_tmp=repeated_length(1,$i);
  print "1/$i --- ",$repeated_length_tmp," -- ",1/$i,"\n";
  if ($repeated_length_tmp > $max_repeated_length) {
    $max_repeated_length=$repeated_length_tmp;
    $max_repeated_length_den=$i;
  }
}
print "\n",$max_repeated_length,"\n";
print "\n",$max_repeated_length_den,"\n";
