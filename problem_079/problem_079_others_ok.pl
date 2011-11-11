use strict;
use warnings;
#1. How many discrete digits are in the code? 8
#2. What are those digits? 0 1 2 3 6 7 8 9
#3. What order are those digits in?
#4. Do the digits repeat? no
sub find_element {
  my $arr_ref=shift;
  my $element=shift;
  for (my $i=0;$i<=$#{$arr_ref};$i++) {
    if ($element==$arr_ref->[$i]) { return 1; }
  }
  return 0;
}
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

my %digit_before=();
for (my $j=0;$j<=$#discrete_digit;$j++) {
  $digit_before{$discrete_digit[$j]}=[];
}
open($in,  "<",  "keylog.txt")  or die "Can't open input.txt: $!";
while (<$in>) {     # assigns each line in turn to $_
  #print "Just read in this line: $_";
  chomp;
  my @split_in=split("",$_);
  for (my $j=0;$j<=$#discrete_digit;$j++) {
    for (my $i=0;$i<$#split_in;$i++) {
      if ($split_in[$i]==$discrete_digit[$j]) {
        for (my $k=$i-1;$k>=0;$k--) {
          if (not find_element(\@{$digit_before{$discrete_digit[$j]}},$split_in[$k])) {
            push(@{$digit_before{$discrete_digit[$j]}},$split_in[$k]);
          }
        }
        last;
      }
    }
  }
}
close $in or die "$in: $!";
#foreach my $key (sort(keys %digit_before)) {
sub find_key {
  my $condition=shift;
  foreach my $key (keys %digit_before) {
    #print $key, '=', @{$digit_before{$key}};
    #print '=', $#{$digit_before{$key}}, "\n";
    if ($condition==$#{$digit_before{$key}}) { return $key; }
  }
  return -1000;
}
for (my $j=0;$j<=$#discrete_digit;$j++) {
  print find_key($j-1);
}
print "\n";
