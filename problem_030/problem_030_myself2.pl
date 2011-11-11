use strict;
use warnings;

my $sum=0;
##for two digits number
for (my $a1=1;$a1<=9;$a1++) {
  for (my $a2=0;$a2<=9;$a2++) {
    if ((10*$a1+$a2) == ($a1**5+$a2**5)) {#have zero!
      my $number=10*$a1+$a2;
      $sum += $number;
      print "$a1$a2 = ",$a1**5," + ",$a2**5,"\n";
    }
  }
}
#for three digits number
for (my $a1=1;$a1<=9;$a1++) {
  for (my $a2=0;$a2<=9;$a2++) {
    for (my $a3=0;$a3<=9;$a3++) {
      if ((100*$a1+10*$a2+$a3) == ($a1**5+$a2**5+$a3**5)) {
        my $number=100*$a1+10*$a2+$a3;
        $sum += $number;
        print "$a1$a2$a3 = ",$a1**5," + ",$a2**5," + ",$a3**5,"\n";
      }
    }
  }
}
#for four digits number
for (my $a1=1;$a1<=9;$a1++) {
  for (my $a2=0;$a2<=9;$a2++) {
    for (my $a3=0;$a3<=9;$a3++) {
      for (my $a4=0;$a4<=9;$a4++) {
        if ((1000*$a1+100*$a2+10*$a3+$a4) == ($a1**5+$a2**5+$a3**5+$a4**5)) {
          my $number=1000*$a1+100*$a2+10*$a3+$a4;
          $sum += $number;
          print "$a1$a2$a3$a4 = ",$a1**5," + ",$a2**5," + ",$a3**5," + ",$a4**5,"\n";
        }
      }
    }
  }
}
#for five digits number
for (my $a1=1;$a1<=9;$a1++) {
  for (my $a2=0;$a2<=9;$a2++) {
    for (my $a3=0;$a3<=9;$a3++) {
      for (my $a4=0;$a4<=9;$a4++) {
        for (my $a5=0;$a5<=9;$a5++) {
          my $number=10000*$a1+1000*$a2+100*$a3+10*$a4+$a5;
          if ($number == ($a1**5+$a2**5+$a3**5+$a4**5+$a5**5)) {
            $sum += $number;
            print "$number = ",$a1**5," + ",$a2**5," + ",$a3**5," + ",$a4**5," + ",$a5**5," = ";
            print $a1**5+$a2**5+$a3**5+$a4**5+$a5**5,"\n";
          }
        }
      }
    }
  }
}
#for six digits number
for (my $a1=1;$a1<=9;$a1++) {
  for (my $a2=0;$a2<=9;$a2++) {
    for (my $a3=0;$a3<=9;$a3++) {
      for (my $a4=0;$a4<=9;$a4++) {
        for (my $a5=0;$a5<=9;$a5++) {
          for (my $a6=0;$a6<=9;$a6++) {
            if ((100000*$a1+10000*$a2+1000*$a3+100*$a4+10*$a5+$a6) == ($a1**5+$a2**5+$a3**5+$a4**5+$a5**5+$a6**5)) {
              my $number=100000*$a1+10000*$a2+1000*$a3+100*$a4+10*$a5+$a6;
              $sum += $number;
              print "$a1$a2$a3$a4$a5$a6 = ",$a1**5," + ",$a2**5," + ",$a3**5," + ",$a4**5," + ",$a5**5," + ",$a6**5,"\n";
            }
          }
        }
      }
    }
  }
}
print "\n",$sum,"\n";
