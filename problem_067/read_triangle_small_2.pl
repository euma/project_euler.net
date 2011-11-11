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
for(my $row=0;$row<=$#total_number;$row++) {
  for(my $col=0;$col<=$#{$total_number[$row]};$col++) {
    print "$total_number[$row][$col]:";
  }
  print "\n";
}
print "---------------\n";
for(my $row=$#total_number;$row>=0;$row--) {
  for(my $col=0;$col<=$#{$total_number[$row]};$col++) {
    print "$total_number[$row][$col]:";
  }
  print "\n";
}
