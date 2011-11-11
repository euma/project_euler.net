use strict;
use warnings;
my $n=$ARGV[0];
our $total=0;
sub print_tree_element {
  my ($i, $j, $n)=@_;
  #print "\n$i/$j\n";
  my $i_plus=$i+1;
  my $j_plus=$j+1;
  if ($i < $n && $j < $n) {
    print_tree_element($i_plus,$j,$n);
    print_tree_element($i,$j_plus,$n);
    $total++;
  }
} 
print_tree_element(0,0,$n);
print $total+1,"\n";
