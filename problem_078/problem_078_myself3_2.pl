use strict;
use warnings;
my $target=$ARGV[0];
my @p=();
for (my $n=1;$n<=$target;$n++) {
  for (my $k=1;$k<=$n;$k++) {
    my $n1=$n-$k*(3*$k-1)/2;
    my $n2=$n-$k*(3*$k+1)/2;
    if ($n1<0) {
      if ($n2<0) { $p[$n]+=(-1)**($k+1)*(0+0); }
      elsif ($n2==0) { $p[$n]+=(-1)**($k+1)*(0+1); }
      else { $p[$n]+=(-1)**($k+1)*(0+$p[$n2]); }
    }
    elsif ($n1==0) {
      if ($n2<0) { $p[$n]+=(-1)**($k+1)*(1+0); }
      elsif ($n2==0) { $p[$n]+=(-1)**($k+1)*(1+1); }
      else { $p[$n]+=(-1)**($k+1)*(1+$p[$n2]); }
    }
    else {
      if ($n2<0) { $p[$n]+=(-1)**($k+1)*($p[$n1]+0); }
      elsif ($n2==0) { $p[$n]+=(-1)**($k+1)*($p[$n1]+1); }
      else { $p[$n] += (-1)**($k+1)*($p[$n1]+$p[$n2]); }
    }
  }
}
for (my $n=1;$n<=$target;$n++) {
  print "$p[$n]--";
}
print "\n";
