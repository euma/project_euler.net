use strict;
use warnings;

#def count( n, m ):
#    if n == 0:
#        return 1
#    if n < 0:
#        return 0
#    if m < 0 and n >= 1:
#        return 0
# 
#    return count( n, m - 1 ) + count( n - S[m], m )
sub count {
  my ($n,$m,$S_ref)=@_;
  #print "count($n,$m,@{$S_ref})\n";
  if ($n == 0) {
    return 1;
  }
  elsif ($n < 0) {
    return 0;
  }
  elsif ($m < 0 and $n >= 1) {
    return 0;
  }
  #elsif ($n < $S->$m and $n != 0) {
  #  return 0;
  #}
  else {
    return count($n, $m - 1,$S_ref) + count($n - $S_ref->[$m], $m,$S_ref);
  }
}
my $target=$ARGV[0];
for (my $n=2;$n<=$target;$n++) {
  print "$n: ";
  my @S=(1 .. $n-1);
  print count($n,$#S,\@S);
  print "\n";
}
