use strict;
use warnings;

sub contain_same_digits {
  #change from sub is_permutation_pair {
  my ($m,$n) = @_;
  if (length($m) != length($n)) {
    #print "return reason:length not equal\n";
    return 0;
  } else {
    my %seen=();
    my @split_m=split("",$m);
    my @split_n=split("",$n);
    for (my $i=0;$i<=$#split_m;$i++) {
      my $not_match=0;
      for (my $j=0;$j<=$#split_n;$j++) {
        if ($split_m[$i] == $split_n[$j]) {
          #print join(" : ",@split_m),"\n";
          #print join(" : ",@split_n),"\n";
          $split_m[$i]=-1;
          $split_n[$j]=-1;
          last;
        } else {
          $not_match++;
        }
      }
      if ($not_match == $#split_n+1) {
        #print "return reason:don't find $split_m[$i] in (@split_n)\n";
        return 0;
      }
    }
    foreach (@split_m) {
      if ($_ != -1) {
        #print "return reason:$_ in m(@split_m) is not -1\n";
        return 0;
      }
    }
    foreach (@split_n) {
      if ($_ != -1) {
        #print "return reason:$_ in n(@split_n) is not -1\n";
        return 0;
      }
    }
    return 1;
  }
}
#my $m=125874;
#my $n=251748;
#if (contain_same_digits($m,$n)) {
#  print "contain same digit\n";
#} else {
#  print "don't contain same digit\n";
#}
my $max=$ARGV[0];
for (my $i=1;$i<=$max;$i++) {
  my $same=0;
  for (my $j=2;$j<6;$j++) {
    if (contain_same_digits($i*$j,$i*($j+1))) {
      $same++;
      print "($i*$j === $i*",$j+1," -- ";
      print $i*$j," === ",$i*($j+1),") -- ";
    } else {
      last;
    }
  }
  if ($same > 0) { print "$i: $same\n"; }
  if ($same == 4) { print "$i: $same\n"; exit 0;}
}
