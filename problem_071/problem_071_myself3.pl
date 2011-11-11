use strict;
use warnings;

#my $limit = $ARGV[0];
#part 1 to generate prime array
my $limit = 8;
my $crosslimit = int(sqrt($limit));
my @sieve = (1,1);
for (my $i = 2;$i<=$limit;$i++) {
  push(@sieve,0);
}
for (my $n = 4; $n<= $limit; $n += 2) {
  $sieve[$n] = 1;
}
for (my $n = 3; $n<= $crosslimit; $n += 2) {
  if (not $sieve[$n]) {
    for (my $m = $n*$n; $m<=$limit; $m += 2*$n) {
      $sieve[$m] = 1;
    }
  }
}
#for (my $n = 2; $n<=$limit; $n++) {
#  if (not $sieve[$n]) {
#    print "$n ";
#  }
#}
#print "\n------------------\n";
#ok!

#part 2 to generate denominator hash
sub logn {
  my $max=shift;
  my $n=shift;
  return log($max)/log($n);
}
my %denominator_hash=();
for (my $n = 2; $n<=$limit; $n++) {
  if (not $sieve[$n]) {
    #print $n,"\n";
    $denominator_hash{$n}=int(logn($limit,$n));
  }
}
#print "denominator hash\n";
#for my $k (keys %denominator_hash) {
#  print "$k => $denominator_hash{$k}\n";
#}
#ok!
#generate denominator
my $denominator=1;
for my $k (keys %denominator_hash) {
  $denominator *= $k**$denominator_hash{$k};
}
#print "denominator = $denominator\n";
#ok!

#part 3 to generate 3/7's numerator hash
my %numerator_hash=();
for my $k (keys %denominator_hash) {
  if ($k == 3) { $numerator_hash{$k}=$denominator_hash{$k}+1;}
  elsif ($k == 7) { $numerator_hash{$k}=$denominator_hash{$k}-1;}
  else { $numerator_hash{$k}=$denominator_hash{$k};}
}
#print "numerator hash\n";
#for my $k (keys %numerator_hash) {
#  print "$k => $numerator_hash{$k}\n";
#}
#ok!
#generate numerator
my $numerator=1;
for my $k (keys %numerator_hash) {
  $numerator *= $k**$numerator_hash{$k};
}
#print "numerator = $numerator\n";
#ok!

#part 4 to find pre faction for 3/7
sub factor1 {
  return @_  if  $_[0] !~ /^(..+?)\1+$/;
  return map { factor1($_) }
  ( "$1", $_[0] =~ s/$1/1/g, $_[0] )[0,-1];
}
sub factor10 {
  return map {length} factor1( 1x$_[0] );
}

my $pre_numerator=$numerator-1;
my $pre_denominator=$denominator;
my %pre_denominator_hash=%denominator_hash;
while ($pre_numerator > 0) {
  my %pre_numerator_hash=();
  my $go_on=1;
  for my $i (factor10($pre_numerator)) {
    if ($i > $limit) { $go_on=0; last; }
    $pre_numerator_hash{$i}++;
  }
  if ($go_on) {
    print "pre numerator hash\n";
    for my $k (keys %pre_numerator_hash) {
      print "$k => $pre_numerator_hash{$k}\n";
    }
    my %pre_numerator_hash_new=();
    my %pre_denominator_hash_new=();
    my $pre_numerator_new=1;
    my $pre_denominator_new=1;
    for my $k (keys %pre_denominator_hash) {
      if (!defined($pre_numerator_hash{$k})) {
	$pre_numerator_hash{$k}=0;
      }
      if ($pre_denominator_hash{$k} == 0 or $pre_numerator_hash{$k} == 0) {
	$pre_numerator_hash_new{$k} = $pre_numerator_hash{$k};
	$pre_denominator_hash_new{$k} = $pre_denominator_hash{$k};
      }
      elsif ($pre_denominator_hash{$k} >= $pre_numerator_hash{$k}) {
	$pre_numerator_hash_new{$k} = 0;
	$pre_denominator_hash_new{$k} = $pre_denominator_hash{$k} - $pre_numerator_hash{$k};
      }
      else {
	$pre_numerator_hash_new{$k} = $pre_numerator_hash{$k} - $pre_denominator_hash{$k};
	$pre_denominator_hash_new{$k} = 0;
      }
      $pre_numerator_new *= ($k**$pre_numerator_hash_new{$k});
      $pre_denominator_new *= ($k**$pre_denominator_hash_new{$k});
    }
    if ($pre_numerator_new < $limit and $pre_denominator_new <= $limit) {
      print "$pre_numerator_new/$pre_denominator_new\n";
      last;
    }
  }
  $pre_numerator--;
}
