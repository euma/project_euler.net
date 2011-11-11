my @ways=();
foreach (0 .. 200) {
  push(@ways,0);
}
$ways[0] = 1;
for my $x (1,2,5,10,20,50,100,200) {
  for my $i ($x .. 201) {
    $ways[$i] += $ways[$i-$x];
  }
  print "\n---------------------\n";
  print join(" -- ",@ways);
  print "\n---------------------\n";
}
#print $ways[200],"\n";
#for (my $i=0;$i<10;$i++) {
#  print "$i: ",$ways[$i],"\n";
#}
