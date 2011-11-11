use strict;
use warnings;
my $n=$ARGV[0];
our $total=0;
our @str=();
sub print_tree_element {
  my ($i, $j, $n)=@_;
  #print "\n$i/$j\n";
  push(@str,"($i,$j)");
  my $i_plus=$i+1;
  my $j_plus=$j+1;
  if ($i_plus <= $n) {
    print_tree_element($i_plus,$j,$n);
  }
  if ($j_plus <= $n) {
    print_tree_element($i,$j_plus,$n);
  }
} 
print_tree_element(0,0,$n);
print $total,"\n";
print join(" -- ",@str),"\n";
#use regular expression to deal str but produce str for n=20 need much time! I can't wait!
