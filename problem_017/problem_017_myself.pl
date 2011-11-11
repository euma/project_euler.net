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
  100=>"one hundred",
  200=>"two hundred",
  300=>"three hundred",
  400=>"four hundred",
  500=>"five hundred",
  600=>"six hundred",
  700=>"seven hundred",
  800=>"eight hundred",
  900=>"nine hundred",
  1000=>"one thousand");
print $num_word{1},"\n";
print length($num_word{1}),"\n";
print $num_word{10},"\n";
print length($num_word{10}),"\n";

my $sum_word=0;
for (my $i=1;$i<=1000;$i++) {
  if ($i<=20) {
    $sum_word += length($num_word{$i}); 
  }
  elsif ($i<=99) {
    $i =~ m/(\d)(\d)/;
    my ($a10,$a1)=($1*10, $2);
    #print $num_word{$a10},"--";
    #print $num_word{$a1},"--";
    #there $1=0 then length($num_word{0}) = 0 is good for sum!
    $sum_word += length($num_word{$a10});
    $sum_word += length($num_word{$a1}); 
    #print "\n$1 $2\n";
    #print "\n",$1*10," $2\n";
  }
  elsif ($i<=999) {
    $i =~ /(\d)(\d)(\d)/;
    my ($a100,$a10,$a1)=($1*100, $2*10,$3);
    if ($a10 == 10) {
      my $b10=$a10+$a1;
      $sum_word += length($num_word{$a100});
      $sum_word += length($num_word{$b10}); 
      $sum_word += 3;# for word and
    } else {
      $sum_word += length($num_word{$a100});
      $sum_word += length($num_word{$a10});
      $sum_word += length($num_word{$a1}); 
      $sum_word += 3;# for word and
    }
  }
}
#$sum_word += length($num_word{1000});
print $sum_word,"\n";
