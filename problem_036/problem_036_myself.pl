use strict;
use warnings;

sub is_palindromic {
  my $n=shift;
  my @split_n=split("",$n);
  if ($n == join("",reverse(@split_n))) {
    return 1;
  }
  else {
    return 0;
  }
}
#my $max=1000;
#for (my $i=0;$i<=$max;$i++) {
#  if (is_palindromic($i)) {
#    print $i,"\n";
#  }
#}
#my $max=10;
#for (my $i=0;$i<=$max;$i++) {
# my $bin_i = sprintf("%b",$i);
#  if ($bin_i =~ /0$/) { print $bin_i,"(0 end)\n"; }
#  else { print $bin_i,"(not 0 end)\n"; }
#}

#my $max=$ARGV[0];
my $max=1000000;
my $sum=0;
for (my $i=1;$i<=$max;$i++) {
  if (is_palindromic($i)) { 
    my $bin_i = sprintf("%b",$i);
    if ($bin_i !~ /0$/ and is_palindromic($bin_i)) {
      print "$i $bin_i\n";
      $sum += $i;
    }
  }
}
print "\n$sum\n";
