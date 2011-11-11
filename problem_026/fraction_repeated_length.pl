use strict;
use warnings;

sub repeated_length {
  #there let
  #num stands for numberator
  #den stands for denominator
  #quo stands for quotient
  #rem stands for remainder
  #my $num = 1;
  #my $den = 7;
  my $num = shift;
  my $den = shift;
  print "($num $den)\n";
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
  #} while (not $stop);
  }
  #print "\n",$rem_count[$target],"\n";
  return $rem_count[$target];
}
for (my $i=2;$i<10;$i++) {
  print repeated_length(1,$i),"\n";
}
