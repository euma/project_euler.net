use strict;
use warnings;

my $sum=0;
my @d19=(0 .. 9);
for my $a1 (@d19) {

  #print $a1,"\n";
  my @d_minus=($a1);
  my @d19_minus=grep{ not $_ ~~ @d_minus } @d19;

  for my $a2 (@d19_minus) {

    my @d_minus2=($a1,$a2);
    my @d19_minus2=grep{ not $_ ~~ @d_minus2 } @d19;

    for my $a3 (@d19_minus2) {

      my @d_minus3=($a1,$a2,$a3);
      my @d_even=(0,2,4,6,8);
      my @d_even_minus=grep{ not $_ ~~ @d_minus3 } @d_even;

      for my $a4 (@d_even_minus) {

        my @d_minus4=($a1,$a2,$a3,$a4);
        my @d_3=();
        foreach (@d19) {
          if (($_ + $a3 + $a4) % 3 == 0) {
            push(@d_3,$_);
          }
        }
        my @d19_minus4=grep{ not $_ ~~ @d_minus4 } @d19;
        #compute two array @d19_minus4 and @d_3 intersection array
        my %count=();
        my @intersection=();
        foreach my $item (@d19_minus4, @d_3) { $count{$item}++;}
        foreach my $item (keys %count) {
          if ($count{$item} == 2) {
            push(@intersection, $item);
          }
        }
        for (keys %count) { delete $count{$_}; }

        for my $a5 (@intersection) {

          my @d_minus5=($a1,$a2,$a3,$a4,$a5);
	  my @d05=(0,5);
          my @d05_minus5=grep{ not $_ ~~ @d_minus5 } @d05;

          for my $a6 (@d05_minus5) {
            my @d_minus6=($a1,$a2,$a3,$a4,$a5,$a6);
            my @d_7=();
            foreach (@d19) {
              if (($_ + $a6*3 + $a5*2) % 7 == 0) {
                push(@d_7,$_);
              }
            }
            my @d19_minus6=grep{ not $_ ~~ @d_minus6 } @d19;
            my %count2=();
            my @intersection2=();
            foreach my $item (@d19_minus6, @d_7) { $count2{$item}++;}
            foreach my $item (keys %count2) {
              if ($count2{$item} == 2) {
                push(@intersection2, $item);
              }
            }

            for my $a7 (@intersection2) {

              my @d_minus7=($a1,$a2,$a3,$a4,$a5,$a6,$a7);
              my @d_11=();
              foreach (@d19) {
                if (($_ + $a7*10 + $a6) % 11 == 0) {
                  push(@d_11,$_);
                }
              }
              my @d19_minus7=grep{ not $_ ~~ @d_minus7 } @d19;
              my %count3=();
              my @intersection3=();
              foreach my $item (@d19_minus7, @d_11) { $count3{$item}++;}
              foreach my $item (keys %count3) {
                if ($count3{$item} == 2) {
                  push(@intersection3, $item);
                }
              }

              for my $a8 (@intersection3) {

                my @d_minus8=($a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8);
                my @d_13=();
                foreach (@d19) {
                  if (($_ + $a8*10 + $a7*9) % 13 == 0) {
                    push(@d_13,$_);
                  }
                }
                my @d19_minus8=grep{ not $_ ~~ @d_minus8 } @d19;
                my %count4=();
                my @intersection4=();
                foreach my $item (@d19_minus8, @d_13) { $count4{$item}++;}
                foreach my $item (keys %count4) {
                  if ($count4{$item} == 2) {
                    push(@intersection4, $item);
                  }
                }
                for my $a9 (@intersection4) {

                  my @d_minus9=($a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8);
                  my @d_17=();
                  foreach (@d19) {
                    if (($_ + $a9*10 + $a8*15) % 17 == 0) {
                      push(@d_17,$_);
                    }
                  }
                  my @d19_minus9=grep{ not $_ ~~ @d_minus9 } @d19;
                  my %count5=();
                  my @intersection5=();
                  foreach my $item (@d19_minus9, @d_17) { $count5{$item}++;}
                  foreach my $item (keys %count5) {
                    if ($count5{$item} == 2) {
                      push(@intersection5, $item);
                    }
                  }
                  for my $a10 (@intersection5) {
  
                    my $str="$a1$a2$a3$a4$a5$a6$a7$a8$a9$a10";
                    print "$str\n";
                    $sum += $str;
                  }
                }
              }
            }

          }
        }
      }
    }
  }
}
print "\n$sum\n";
