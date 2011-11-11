use strict;
use warnings;

open(my $in,  "<",  "triangle_small.txt")  or die "Can't open input.txt: $!";
my @lines = <$in>;
close $in or die "$in: $!";
#print $#lines+1; print "\n";
#for my $i (@lines)
#{
#  chomp $i;
#  print $i;
#  print "\n";
#}
for (my $i=$#lines; $i>=0; $i--)
{
  chomp($lines[$i]);
  #print $lines[$i];
  my @split_lines=split(" ",$lines[$i]);
  for (my $j=0;$j<=$#split_lines;$j++)
  {
  print "($i, $j)-> $split_lines[$j]\n";
  }
  print "\n------------\n";
}
