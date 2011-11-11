use strict;
use warnings;

#def farey( n, asc=True ):
#    """Python function to print the nth Farey sequence, either ascending or descending."""
#    if asc: 
#        a, b, c, d = 0, 1,  1  , n     # (*)
#    else:
#        a, b, c, d = 1, 1, n-1 , n     # (*)
#    print "%d/%d" % (a,b)
#    while (asc and c <= n) or (not asc and a > 0):
#        k = int((n + b)/d)
#        a, b, c, d = c, d, k*c - a, k*d - b
#        print "%d/%d" % (a,b)
sub farey {
  # function to print the nth Farey sequence ascending
  my $n=shift;
  my ($a, $b, $c, $d) = (0, 1,  1  , $n); #$a/$b=0/1,$c/$d=1/$n
  #print "$a/$b $c/$d\n";#ok!
  print "$a/$b  ";
  #while ($c <= $n) {
  while ($c < $n) {
    my $k = int(($n + $b)/$d);
    #print "$k\n";
    #my ($a, $b, $c, $d) = ($c, $d, $k*$c - $a, $k*$d - $b);
    #my ($c, $d, $a, $b) = ($k*$c - $a, $k*$d - $b, $c, $d);
    my $c_tmp=$c;
    my $d_tmp=$d;
    $c=$k*$c-$a;
    $d=$k*$d-$b;
    $a=$c_tmp;
    $b=$d_tmp;
    #print "$a/$b $c/$d\n";
    print "$a/$b  ";
    if ($a==3 and $b==7) { last; }
  }
  print "\n";
}
my $n=$ARGV[0];
farey($n);
