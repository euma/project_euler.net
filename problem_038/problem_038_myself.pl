use strict;
use warnings;


sub is_pandigital9 {
  my $n=shift;
  if (length($n) == 9) {
    if ($n !~ /0/) {
      #print $n,"\n";
      my @split_n=split("",$n);
      #print join(":",@split_n),"\n";
      my @seen = ();
      foreach (0 .. 9) {
        push(@seen,0);
      }
      #foreach (@split_n) {
      #  $seen[$_]++;
      #}
      for (my $i=0;$i<=$#split_n;$i++) {
        $seen[$split_n[$i]]++;
      }
      foreach (1 .. 9) {
        #print "$_:$seen[$_] -- ";
        if ($seen[$_] >1) { return 0; }
      }
      return 1;
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}
#my $n=192384576;
#print is_pandigital9($n);
#print "\n-----------------\n";
#$n=192234576;
#print is_pandigital9($n);
#print "\n-----------------\n";
my $largest=0;
my $max=9;
for (my $i=2;$i<$max;$i++) {
  my @arr=(1 .. $i);
  my $prod=1;
  while (1) {
    my @arr_prod=();
    for (my $i=0;$i<=$#arr;$i++) {
      push(@arr_prod,$prod*$arr[$i]);
    }
    my $num=join("",@arr_prod);
    if (length($num) > 9) { last; }
    else {
      if (is_pandigital9($num)) {
        print "$prod*(1 .. $i) = $num\n";
        if ($num > $largest) { $largest=$num; }
      }
    }
    $prod++;
  }
}
print "\n$largest\n";
