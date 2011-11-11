use strict;
use warnings;

open(my $in,  "<",  "triangle_small.txt")  or die "Can't open input.txt: $!";
my @total_number=();
while(<$in>) {
  chomp;
  my @line_split=split(" ",$_);
  push(@total_number,\@line_split);
}
close $in or die "$in: $!";
for(my $row=$#total_number;$row>=0;$row--) {
  for(my $col=0;$col<$#{$total_number[$row]};$col++) {
    print "($total_number[$row][$col], $total_number[$row][$col+1]) ";
    if ($total_number[$row][$col] > $total_number[$row][$col+1]) {
      $total_number[$row-1][$col] += $total_number[$row][$col];
    }
    else
    {
      $total_number[$row-1][$col] += $total_number[$row][$col+1];
    }
  }
  print "\n";
}
print "\n";
print $total_number[0][0];
print "\n";
