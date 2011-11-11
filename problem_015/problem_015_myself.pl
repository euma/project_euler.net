use strict;
use warnings;
# for n = 20 this programm use too much time!
# I hav't pacient to wait!
my $n=$ARGV[0];
our $total=0;
sub print_tree_element {
  #my $i=@_[0]; my $j=@_[1]; my $n=@_[2];
  #my $i=shift; my $j=shift; my $n=shift;
  #my $i=$_[0]; my $j=$_[1]; my $n=$_[2];my $limit=$_[3];
  my ($i, $j, $n, $limit)=@_;
  #print "\n$i/$j -- $limit -- $total\n";
  if ( $i == $n && $j == $n ) { $total++; }
  #print "\n$i -- $j -- $n -- $limit\n";
  #if ($i<$n && $j<$n) {
  #if (($i + $j) <= $n) {
  #if (($i + $j) < $n) {
  if ($limit > 0) {
    my $i_plus=$i+1;
    my $j_plus=$j+1;
    my $limit_minus=$limit-1;
    print_tree_element($i_plus,$j,$n,$limit_minus);
    print_tree_element($i,$j_plus,$n,$limit_minus);
  }
} 
print_tree_element(0,0,$n,2*$n);
print $total,"\n";
