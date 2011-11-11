use strict;
use warnings;

sub count {
  my ($n,$m,$S_ref)=@_;
  #initialize table with base cases
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
my $n_max=$ARGV[0];
for (my $n=2;$n<=$n_max;$n++) {
  my @S=(1 .. $n-1);
  my $num=count($n,$#S,\@S)+1;
  print "$num\n";
  if ($num % 1000000 == 0) { print "find!\n";last; }
}
