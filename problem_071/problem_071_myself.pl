use strict;
use warnings;
use bigrat;

sub gcd {
  my ($a, $b)=@_;
  while ($b != 0) {
    my $t = $b;
    $b = $a % $b;
    $a = $t;
  }
  return $a;
}
my $max=$ARGV[0];
my @rat_arr=();
for (my $i=1;$i<=$max;$i++) {
  for (my $j=$i+1;$j<=$max;$j++) {
    if (gcd($i,$j)==1) { my $rat=$i/$j;push(@rat_arr,$rat); }
  }
}
print join(" -- ",@rat_arr);
print "\n-------------------\n";
print join(" -- ",sort {$a <=> $b } @rat_arr);
print "\n-------------------\n";
#my @sort_rat= sort {$b <=> $a } @rat_arr;
#for (my $i=$#sort_rat;$i>=0;$i--) {
#  if ($sort_rat[$i] == 3/7) {
#    print "$sort_rat[$i+1]  ";
#    last;
#  }
#}
print "\n-------------------\n";
print join(" -- ",sort {$b <=> $a } @rat_arr);
print "\n-------------------\n";
my @sort_rat= sort {$b <=> $a } @rat_arr;
for (my $i=$#sort_rat;$i>=0;$i--) {
  if ($sort_rat[$i] == 3/7) {
    #print "$sort_rat[$i-1]  ";
    print "$sort_rat[$i+1]\n";
    my @split_rat=split("/",$sort_rat[$i+1]);
    print "$split_rat[0]\n";
    last;
  }
}
