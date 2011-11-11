use warnings;
use strict;
my %num_word = (
  0=>"",
  1=>"one",
  2=>"two",
  3=>"three",
  4=>"four",
  5=>"five",
  6=>"six",
  7=>"seven",
  8=>"eight",
  9=>"nine",
  10=>"ten",
  11=>"eleven",
  12=>"twelve",
  13=>"thirteen",
  14=>"fourteen",
  15=>"fifteen",
  16=>"sixteen",
  17=>"seventeen",
  18=>"eighteen",
  19=>"nineteen",
  20=>"twenty",
  30=>"thirty",
  40=>"forty",
  50=>"fifty",
  60=>"sixty",
  70=>"seventy",
  80=>"eighty",
  90=>"ninety",
#  100=>"one hundred",
#  200=>"two hundred",
#  300=>"three hundred",
#  400=>"four hundred",
#  500=>"five hundred",
#  600=>"six hundred",
#  700=>"seven hundred",
#  800=>"eight hundred",
#  900=>"nine hundred",
#  1000=>"one thousand"
);

my $sum_word=0;
for (my $i=1;$i<=1000;$i++) {
  if ($i<=20) {
    print $num_word{$i}," -- ";
    print length($num_word{$i}),"\n";
    $sum_word += length($num_word{$i}); 
  }
  elsif ($i<=99) {
    $i =~ /^(\d)(\d)$/;
    my ($a10,$a1)=($1*10, $2);
    print $num_word{$a10}," ",$num_word{$a1}," -- ";
    print length($num_word{$a10})," + ",length($num_word{$a1}),"\n";
    $sum_word += (length($num_word{$a10}) + length($num_word{$a1}));
  }
  elsif ($i<=999) {
    $i =~ /^(\d)(\d)(\d)$/;
    my ($a100,$a10,$a1)=($1, $2*10,$3);
    if ($a10 == 0 && $a1 == 0) {
      print $num_word{$a100}," hundred"," -- ";
      print length($num_word{$a100})," + ",length("hundred"),"\n";
      $sum_word += (length($num_word{$a100}) + length("hundred"));#there don't need 'and'
    }
    elsif ($a10 == 10) {
      my $b10=$a10+$a1;
      print $num_word{$a100}," hundred and ",$num_word{$b10}," -- ";
      print length($num_word{$a100})," + ", length("hundred")," + ",length("and")," + ",length($num_word{$b10}),"\n";
      $sum_word += (length($num_word{$a100}) + length("hundred") + length("and") + length($num_word{$b10}));
    } else {
      print $num_word{$a100}," hundred and ",$num_word{$a10},"-",$num_word{$a1}," -- ";
      print length($num_word{$a100})," + ",length("hundred")," + ",length("and")," + ",length($num_word{$a10})," + ",length($num_word{$a1}),"\n";
      $sum_word += (length($num_word{$a100}) + length("hundred") + length("and") + length($num_word{$a10}) + length($num_word{$a1}));
    }
  }
}
$sum_word += (length($num_word{1}) + length("thousand"));
print "\n",$sum_word,"\n";
