use strict;
use warnings;

sub count {
  my ($n,$m,$S_ref)=@_;
  my %table=();

  for (my $i=0;$i<=$n;$i++) {
    for (my $j=0;$j<=$m;$j++) {
      my $n1=$i-$S_ref->[$j];
      my $m1=$j;
      my $n2=$i;
      my $m2=$j-1;

      if ($n1 == 0) { $table{$n1}{$m1}=1; }
      elsif ($n1 < 0) { $table{$n1}{$m1}=0; }
      elsif ($m1 < 0 and $n1 >= 1) { $table{$n1}{$m1}=0; }

      if ($n2 == 0) { $table{$n2}{$m2}=1; }
      elsif ($n2 < 0) { $table{$n2}{$m2}=0; }
      elsif ($m2 < 0 and $n2 >= 1) { $table{$n2}{$m2}=0; }

      $table{$i}{$j} = $table{$n1}{$m1} + $table{$n2}{$m2};
    }
  }
  return $table{$n}{$m};
}
my $n=$ARGV[0];
if ($n <=1 ) { print "there is no prime at all!";exit 1; }
#Let A be an array of bool values, indexed by integers 2 to n, initially all set to true.
my @A=();
for (my $i=2;$i<=$n;$i++) {
  $A[$i]=1;
}
for (my $i = 2;$i<=$n/2;$i++) {
  if ($A[$i] == 1) {
    for (my $j=2*$i;$j<=$n;$j=$j+$i) {
      $A[$j] = 0;
    }
  }
}
my @S=();
for (my $i = 2;$i<=$n;$i++) {
  if ($A[$i]==1) { push(@S,$i); }
}
print "===========@S\n";
for (my $m=2;$m<=$n;$m++) {
  my @Sm=();
  for (my $i = 0;$i<=$#S;$i++) {
    if ($S[$i]<=$m) { push(@Sm,$S[$i]); }
  }
  print "----$m-----------@Sm\n";
  print count($m,$#Sm,\@Sm);
  print "\n";
}
