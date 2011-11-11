my %sum;
my @fact = (1, 1, 2, 6, 24, 120, 720, 5_040, 40_320, 362_880);
for (my $i=70; $i<999999; $i++) {
  %h=();
  $x60++ if chains($i)==60; 
}
print "Answer to PE74 = $x60";
 
sub chains {
  $n = shift;
  return scalar keys %h if $h{$n};
  $h{$n}++;
  unless ( $sum{$n} ) { $sum{$n} += $fact[$_] for split //,$n }
return chains($sum{$n});
}
