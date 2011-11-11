use strict;
use warnings;
use bignum;

my $limit=$ARGV[0];
my $total=0;
for (my $digit=1;$digit<=$limit;$digit++)
{
  print "$digit: ";
  my $start=10**($digit-1);
  my $end=10**$digit-1;
  print "$start $end\n";

  my $num=0;
  my $start_digit=0;
  $num=$start**(1/$digit);
  #printf("%.2f, ",$num);
  print $num; print "\n";
  if ($num == int($num)) { $start_digit=$num; }
  else { $start_digit=int($num)+1; }

  my $end_digit=0;
  $num=$end**(1/$digit);
  print $num; print "\n";
  #printf("%.2f\n",$num);
  if ($num == int($num)) { $end_digit=$num; }
  else { $end_digit=int($num); }

  #for (my $i=$start_digit-1;$i<=$end_digit+1;$i++)
  print "($start_digit, $end_digit)\n\n";
  for (my $i=$start_digit;$i<=$end_digit;$i++)
  {
    my $i_digit=$i**$digit;
    if ($i_digit <= $end) {
      print "$i**$digit = $i_digit\n";
      $total++;
    }
  }
  print "\n$total-------------\n";
}
print "\n$total\n";
