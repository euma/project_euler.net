use strict;
use warnings;

##for two digits number
#for (my $a1=1;$a1<=9;$a1++) {
#  for (my $a2=0;$a2<=9;$a2++) {
#    #print "$a1$a2 --- ",$a1*$a1," + ",$a2*$a2," = ",$a1*$a1+$a2*$a2,"\n";
#    #if ((10*$a1+$a2) == ($a1*$a1+$a2*$a2)) {#have zero!
#    if ((10*$a1+$a2) == ($a1*$a1+$a2*$a2+1)) {#have two
#      print "$a1$a2 = ",$a1*$a1," + ",$a2*$a2,"\n";
#      #print "$a1$a2 = ",$a1*$a1," + ",$a2*$a2," + 1","\n";
#    }
#  }
#}
#for three digits number
#for (my $a1=1;$a1<=9;$a1++) {
#  for (my $a2=0;$a2<=9;$a2++) {
#    for (my $a3=0;$a3<=9;$a3++) {
#      if ((100*$a1+10*$a2+$a3) == ($a1*$a1*$a1+$a2*$a2*$a2+$a3*$a3*$a3)) {
#        print "$a1$a2$a3 = ",$a1*$a1*$a1," + ",$a2*$a2*$a2," + ",$a3*$a3*$a3," = ";
#        print $a1*$a1*$a1+$a2*$a2*$a2+$a3*$a3*$a3,"\n";
#      }
#    }
#  }
#}
#for four digits number
#for (my $a1=1;$a1<=9;$a1++) {
#  for (my $a2=0;$a2<=9;$a2++) {
#    for (my $a3=0;$a3<=9;$a3++) {
#      for (my $a4=0;$a4<=9;$a4++) {
#        if ((1000*$a1+100*$a2+10*$a3+$a4) == ($a1**4+$a2**4+$a3**4+$a4**4)) {
#          print "$a1$a2$a3$a4 = ",$a1**4," + ",$a2**4," + ",$a3**4," + ",$a4**4," = ";
#          print $a1**4+$a2**4+$a3**4+$a4**4,"\n";
#        }
#      }
#    }
#  }
#}
#for five digits number
my $sum=0;
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
print "\n",$sum,"\n";
#for six digits number
#for (my $a1=1;$a1<=9;$a1++) {
#  for (my $a2=0;$a2<=9;$a2++) {
#    for (my $a3=0;$a3<=9;$a3++) {
#      for (my $a4=0;$a4<=9;$a4++) {
#        for (my $a5=0;$a5<=9;$a5++) {
#          for (my $a6=0;$a6<=9;$a6++) {
#            if ((100000*$a1+10000*$a2+1000*$a3+100*$a4+10*$a5+$a6) == ($a1**6+$a2**6+$a3**6+$a4**6+$a5**6+$a6**6)) {
#              print "$a1$a2$a3$a4$a5$a6 = ",$a1**6," + ",$a2**6," + ",$a3**6," + ",$a4**6," + ",$a5**6," + ",$a6**6," = ";
#              print $a1**6+$a2**6+$a3**6+$a4**6+$a5**6+$a6**6,"\n";
#            }
#          }
#        }
#      }
#    }
#  }
#}
