#!/usr/bin/perl
use strict;
use warnings;
my $rows=5;
my $columns=5;
my @grid=(
  [1, 2, 3, 4, 5],
  [6, 7, 8, 9, 10],
  [11, 12, 13, 14, 15],
  [16, 17, 18, 19, 20],
  [21, 22, 23, 24, 25],
);
my $adjacents=3;
#print row ok!
#for (my $i=0; $i<$rows; $i++) {
#  for (my $j=0; $j<$columns-$adjacents+1; $j++) {
#    for (my $k=0; $k<$adjacents;$k++) {
#      print $grid[$i][$j+$k]," -- ";
#    }
#  print "\n";
#  }
#  print "\n--------------------------------\n";
#}
#print column ok!
#for (my $i=0; $i<$columns; $i++) {
#  for (my $j=0; $j<$rows-$adjacents+1; $j++) {
#    for (my $k=0; $k<$adjacents;$k++) {
#      print $grid[$j+$k][$i]," -- ";
#    }
#  print "\n";
#  }
#  print "\n--------------------------------\n";
#}
#compute up-left direction diagonal
#part 1
#for (my $i=0;$i<$rows-$adjacents+1;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$i+$j]," -- ";
#  }
#  print "\n";
#}
#part 2
#for (my $i=0;$i<$rows-$adjacents+1-1;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$i+1+$j]," -- ";
#  }
#  print "\n";
#}
#part 3
#for (my $i=0;$i<$rows-$adjacents+1-2;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$i+2+$j]," -- ";
#  }
#  print "\n";
#}
#combine part 1 2 3
#for (my $k=0;$k<$rows-$adjacents+1;$k++) {
#  for (my $i=0;$i<$rows-$adjacents+1-$k;$i++) {
#    for (my $j=0;$j<$adjacents;$j++) {
#      print $grid[$i+$j][$i+$k+$j]," -- ";
#    }
#    print "\n";
#  }
#  print "\n----------------------------\n";
#}
#part 2
#for (my $i=1;$i<$rows-$adjacents+1;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$i-1+$j]," -- ";
#  }
#  print "\n";
#}
#part 3
#for (my $i=2;$i<$rows-$adjacents+1;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$i-2+$j]," -- ";
#  }
#  print "\n";
#}
#combine part 1 2 3
#for (my $k=0;$k<$rows-$adjacents+1;$k++) {
#  for (my $i=$k;$i<$rows-$adjacents+1;$i++) {
#    for (my $j=0;$j<$adjacents;$j++) {
#      print $grid[$i+$j][$i-$k+$j]," -- ";
#    }
#    print "\n";
#  }
#  print "\n-----------------------------\n";
#}
#combine part 2 3
#for (my $k=1;$k<$rows-$adjacents+1;$k++) {
#  for (my $i=$k;$i<$rows-$adjacents+1;$i++) {
#    for (my $j=0;$j<$adjacents;$j++) {
#      print $grid[$i+$j][$i-$k+$j]," -- ";
#    }
#    print "\n";
#  }
#  print "\n-----------------------------\n";
#}

#compute up-right direction diagonal ok!
#part 1
#for (my $i=0;$i<$rows-$adjacents+1;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$rows-$i-1-$j]," -- ";
#  }
#  print "\n";
#}
#part 2
#for (my $i=0;$i<$rows-$adjacents+1-1;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$rows-$i-1-1-$j]," -- ";
#  }
#  print "\n";
#}
#part 3
#for (my $i=0;$i<$rows-$adjacents+1-2;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$rows-$i-1-2-$j]," -- ";
#  }
#  print "\n";
#}
#combine 1 2 3
#for (my $k=0;$k<$rows-$adjacents+1;$k++) {
#  for (my $i=0;$i<$rows-$adjacents+1-$k;$i++) {
#    for (my $j=0;$j<$adjacents;$j++) {
#      print $grid[$i+$j][$rows-$i-1-$k-$j]," -- ";
#    }
#    print "\n";
#  }
#  print "\n------------------------------------\n";
#}
#part -1
#for (my $i=1;$i<$rows-$adjacents+1;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$rows-$i-1+1-$j]," -- ";
#  }
#  print "\n";
#}
#part -2
#for (my $i=2;$i<$rows-$adjacents+1;$i++) {
#  for (my $j=0;$j<$adjacents;$j++) {
#    print $grid[$i+$j][$rows-$i-1+2-$j]," -- ";
#  }
#  print "\n";
#}
#combine 1 -1 -2
#for (my $k=0;$k<$rows-$adjacents+1;$k++) {
#  for (my $i=$k;$i<$rows-$adjacents+1;$i++) {
#    for (my $j=0;$j<$adjacents;$j++) {
#      print $grid[$i+$j][$rows-$i-1+$k-$j]," -- ";
#    }
#    print "\n";
#  }
#  print "\n-------------------------------------\n";
#}
#combine -1 -2
for (my $k=1;$k<$rows-$adjacents+1;$k++) {
  for (my $i=$k;$i<$rows-$adjacents+1;$i++) {
    for (my $j=0;$j<$adjacents;$j++) {
      print $grid[$i+$j][$rows-$i-1+$k-$j]," -- ";
    }
    print "\n";
  }
  print "\n-------------------------------------\n";
}
