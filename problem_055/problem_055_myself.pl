use strict;
use warnings;
use bignum;

sub reverse_num {
  my $num=shift;
  my @split_num=split("",$num);
  return join("",reverse(@split_num));
}
#print "test reverse_num subroutine begin\n";
##print reverse_num(123);
#print reverse_num(1);
#print "\ntest reverse_num subroutine end\n";
sub is_palindromic {
  my $num=shift;
  if ($num == reverse_num($num)) {
    return 1;
  }
  else {
    return 0;
  }
}
#print "test is_palindromic subroutine begin\n";
##my $num=121;
##my $num=12;
##my $num=2;
#if (is_palindromic($num)) {
#  print "$num yes!\n";
#} else {
#  print "$num no!\n";
#}
#print "test is_palindromic subroutine end\n";
sub is_lychrel_num {
  my $num=shift;
  #my $i=0;
  #while (1) {
  for (my $i=1;$i<50;$i++) {
    #print "$num + ",reverse_num($num);
    $num = $num + reverse_num($num);
    #print " = $num\n";
    if (is_palindromic($num)) {
      return 0;
    }
    #$i++;
  }
  return 1;
}
#print "test is_lychrel_num subroutine begin\n";
##my $num=47;
##my $num=349;
#my $num=10677;
#if (is_lychrel_num($num)) {
#  print "$num yes!\n";
#} else {
#  print "$num no!\n";
#}
#print "test is_lychrel_num subroutine end\n";

my $total=0;
for (my $i=0;$i<10000;$i++) {
  if (is_lychrel_num($i)) {
    $total++;
  }
}
print "\n###############\n";
print $total;
print "\n###############\n";
