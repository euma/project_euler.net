use strict;
use warnings;
#1. How many discrete digits are in the code? 8
#2. What are those digits? 0 1 2 3 6 7 8 9
#3. What order are those digits in?
#4. Do the digits repeat? no
open(my $in,  "<",  "keylog.txt")  or die "Can't open input.txt: $!";
my %seen=();
my @discrete_digit=();
while (<$in>) {     # assigns each line in turn to $_
  #print "Just read in this line: $_";
  chomp;
  my @split_in=split("",$_);
  for (my $i=0;$i<$#split_in;$i++) {
    if (not $seen{$split_in[$i]}) { push(@discrete_digit,$split_in[$i]); }
    print "$split_in[$i] ";
    $seen{$split_in[$i]}=1;
  }
  print "\n";
}
close $in or die "$in: $!";
print "@discrete_digit\n";
