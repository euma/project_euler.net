use strict;
use warnings;

sub is_pandigital09 {
  my $n=shift;
  $n=sprintf("%010d",$n);
  #print "$n: ",length($n),"\n";
  my $digit=10;
  if (length($n) == $digit) {
      my @split_n=split("",$n);
      #print join(":",@split_n),"\n";
      my @seen = ();
      foreach (0 .. $digit-1) {
        push(@seen,0);
      }
      for (my $i=0;$i<=$#split_n;$i++) {
        $seen[$split_n[$i]]++;
      }
      foreach (0 .. $digit-1) {
        if ($seen[$_] != 1 ) { return 0; }
      }
      return 1;
  } else {
    return 0;
  }
}
#if (is_pandigital09(103456789)) {
#if (is_pandigital09(1203456789)) {
#if (is_pandigital09(123456789)) {
#  print "yes!\n";
#} else {
#  print "no!\n";
#}
my $start=1234567890;
my $end=9876543210;
for (my $i=$start;$i<=$end;$i++) {
  if ($i =~ /^\d{5}[05]\d{4}/) {
    if ($i =~ /^\d{3}[02468]\d{6}/) {
      print "$i\n";
    }
  }
}
