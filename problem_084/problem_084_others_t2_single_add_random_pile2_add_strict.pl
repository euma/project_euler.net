use strict;
use warnings;
#game rules
#1. requiring a double to "get out of jail"
#At the beginning of the game, the CC and CH cards are shuffled
#Community Chest (2/16 cards): 


my @board=();
my $board_size=40;

for my $i (0 .. $board_size-1) {
  $board[$i] = 0;
}

my @board_map=('GO','A1','CC1','A2','T1','R1','B1','CH1','B2','B3','JAIL',
  'C1','U1','C2','C3','R2','D1','CC2','D2','D3','FP',
  'E1','CH2','E2','E3','R3','F1','F2','U2','F3','G2J',
  'G1','G2','CC3','G3','R4','CH3','H1','T2','H2',
);

my $pile_size=16;
#shuffle chance card pile
our @chance_card_pile=();
for (my $i=0; $i<$pile_size;$i++) {
  $chance_card_pile[$i]=$i;
}
for (my $i = 0; $i < $pile_size; $i++) {
  my $j = int(rand($pile_size-$i))+$i;
  #swap(a[i], a[random(i,n)])
  my $tmp=$chance_card_pile[$i];
  $chance_card_pile[$i]=$chance_card_pile[$j];
  $chance_card_pile[$j]=$tmp;
}
for (my $i=0; $i<$pile_size;$i++) {
  print "$chance_card_pile[$i] ";
}
print "\n";

#shuffle community chest card pile
our @community_chest_card_pile=();
for (my $i=0; $i<$pile_size;$i++) {
  $community_chest_card_pile[$i]=$i;
}
for (my $i = 0; $i < $pile_size; $i++) {
  my $j = int(rand($pile_size-$i))+$i;
  #swap(a[i], a[random(i,n)])
  my $tmp=$community_chest_card_pile[$i];
  $community_chest_card_pile[$i]=$community_chest_card_pile[$j];
  $community_chest_card_pile[$j]=$tmp;
}
for (my $i=0; $i<$pile_size;$i++) {
  print "$community_chest_card_pile[$i] ";
}
print "\n";

our $player_position = 0;
our $community_chest_card_position = 0;
our $chance_card_position = 0;

my $number_of_doubles = 0;
my $size_of_dice = 6;

#my $number_of_moves = 100000000;
my $number_of_moves = 40;

sub take_community_chest_card {

  #when community chest card position is 3 then Advance to GO
  if ($community_chest_card_position==$community_chest_card_pile[0]) {
    $player_position = 0;
    print "$community_chest_card_position==$community_chest_card_pile[0] get community chest 0 so goto $board_map[$player_position]($player_position)";
  }
  #when community chest card position is 9 then Go to JAIL
  elsif($community_chest_card_position==$community_chest_card_pile[1]) {
    $player_position = 10;
    print "$community_chest_card_position==$community_chest_card_pile[1] get community chest 1 so goto $board_map[$player_position]($player_position)";
  }
  else {
    print "$community_chest_card_position!=$community_chest_card_pile[0] $community_chest_card_pile[1] don't get community chest so stay here $board_map[$player_position]($player_position)";
  }
  $community_chest_card_position += 1;
  #when community chest card position is $pile_size then a recycle is complete!
  if ( $community_chest_card_position == $pile_size) {
    $community_chest_card_position = 0;
    print "(community chest card position=$pile_size so change community chest card position = 0)";
  }
}

#Chance (10/16 cards):
sub take_chance_card {

  #when chance card position is 0 then Advance to GO
  if($chance_card_position==$chance_card_pile[0]) {
    $player_position = 0;
    print "$chance_card_position==$chance_card_pile[0] get chance 0 so goto $board_map[$player_position]($player_position)";
  }
  #when chance card position is 1 then Go to JAIL
  elsif($chance_card_position==$chance_card_pile[1]) {
    $player_position = 10;
    print "$chance_card_position==$chance_card_pile[1] get chance 1 so goto $board_map[$player_position]($player_position)";
  }
  #when chance card position is 2 then Go to C1
  elsif($chance_card_position==$chance_card_pile[2]) {
    $player_position = 11;
    print "$chance_card_position==$chance_card_pile[2] get chance 2 so goto $board_map[$player_position]($player_position)";
  }
  #when chance card position is 3 then Go to E3
  elsif($chance_card_position==$chance_card_pile[3]) {
    $player_position = 24;
    print "$chance_card_position==$chance_card_pile[3] get chance 3 so goto $board_map[$player_position]($player_position)";
  }
  #when chance card position is 4 then Go to H2
  elsif($chance_card_position==$chance_card_pile[4]) {
    $player_position = 39;
    print "$chance_card_position==$chance_card_pile[4] get chance 4 so goto $board_map[$player_position]($player_position)";
  }
  #when chance card position is 5 then Go to R1
  elsif($chance_card_position==$chance_card_pile[5]) {
    $player_position = 5;
    print "$chance_card_position==$chance_card_pile[5] get chance 5 so goto $board_map[$player_position]($player_position)";
  }
  #when chance card position is 6 or 7 then Go to next R (railway company)
  elsif($chance_card_position==$chance_card_pile[6] or $chance_card_position==$chance_card_pile[7]) {
    print "$chance_card_position==$chance_card_pile[6] or ==$chance_card_pile[7] ";
    #when player position before R1(5) then go to R1
    if ($player_position < 5) {
      $player_position = 5;
      print "get chance 6/7 so goto $board_map[$player_position]($player_position)";
    }
    #when player position before R2(15) then go to R2
    elsif ($player_position < 15) {
      $player_position = 15;
      print "get chance 6/7 so goto $board_map[$player_position]($player_position)";
    }
    #when player position before R3(25) then go to R3
    elsif ($player_position < 25) {
      $player_position = 25;
      print "get chance 6/7 so goto $board_map[$player_position]($player_position)";
    }
    #when player position before R4(35) then go to R4
    elsif ($player_position < 35) {
      $player_position = 35;
      print "get chance 6/7 so goto $board_map[$player_position]($player_position)";
    }
    #when player position before R1(5) then go to R1
    else {
      $player_position = 5;
      print "get chance 6/7 so goto $board_map[$player_position]($player_position)";
    }
  }
  #when chance card position is 8 then Go to next U (utility company)
  elsif($chance_card_position==$chance_card_pile[8]) {
    #when player position before U1(12) then go to U1
    print "$chance_card_position==$chance_card_pile[8] ";
    if ($player_position < 12) {
      $player_position = 12;
      print "get chance 8 so goto $board_map[$player_position]($player_position)";
    }
    #when player position before U2(28) then go to U2
    elsif ($player_position < 28) {
      $player_position = 28;
      print "get chance 8 so goto $board_map[$player_position]($player_position)";
    }
    #when player position before U1(12) then go to U1
    else {
      $player_position = 12;
      print "get chance 8 so goto $board_map[$player_position]($player_position)";
    }
  }
  #when chance card position is 9 then Go back 3 squares.
  elsif($chance_card_position==$chance_card_pile[9]) {
    $player_position = $player_position - 3;
    print "$chance_card_position==$chance_card_pile[9] get chance 9 so goto $board_map[$player_position]($player_position)";
    #when player position = 30 there go back 3 squares get CH3
    if ($player_position == 33) {
      #take_community_chest_card();
      &take_community_chest_card();
    }
  }
  else {
    print "$chance_card_position!=";
    for (my $i=0;$i<10;$i++) {
      print "$chance_card_pile[9] ";
    }
    print " don't get chance so stay here $board_map[$player_position]($player_position)";
  }
  $chance_card_position += 1;
  #when chance card position is $pile_size then a recycle is complete!
  if ( $chance_card_position == $pile_size) {
    $chance_card_position = 0;
  }
}



print "(player position,community chest card position, chance card position, number of doubles)\n";

my $non_doubles=0;
for my $i (1 .. $number_of_moves) {
  print "($board_map[$player_position]($player_position), $community_chest_card_position, $chance_card_position) ($number_of_doubles)\n";
  my $next=<>;
  print "ok next!\n";

  my $dice1 = int(rand($size_of_dice)) + 1;
  my $dice2 = int(rand($size_of_dice)) + 1;
  if ($dice1 == $dice2) {
    $number_of_doubles += 1;
    $non_doubles=0;
  } else {
   $non_doubles=1;
  }
  #if a player rolls three consecutive doubles, they do not advance the result of their 3rd roll. Instead they proceed directly to jail.
  #if we only get once three doubles
  #use if ($number_of_doubles == 3 and $non_doubles==0;) {
  #so there will not happen I don't deal doubles but I go to jail because $number_of_doubles don't change when I deal non-doubles!
  if ($number_of_doubles == 3) {
    $player_position = 10;
    print "-> number of doubles = 3 so goto $board_map[$player_position]($player_position)";
    $number_of_doubles = 0;#I think there set number of doubles goto zero is ok! otherwise number of doubles will greater than 3 all the time when you get 4th double dice
  }
  else {
    $player_position += ($dice1 + $dice2);
    print "-> + "; print $dice1 + $dice2;
    if ($player_position > $board_size-1) {
      $player_position = $player_position - 40;
    }
    #when player get into CC{1,2,3} or CH{1,2,3}
    #if he get empty instruction and then he will remain in then CC or CH square then he will dice or take next CC/CH card to get instruction to go
    elsif ($player_position == 2 or $player_position == 17 or $player_position == 33) {
      print "-> $board_map[$player_position]($player_position) in CC{1,2,3}";
      &take_community_chest_card();
    }
    elsif ($player_position == 7 or $player_position == 22 or $player_position == 36) {
      print "-> $board_map[$player_position]($player_position) in CH{1,2,3}";
      &take_chance_card();
    }
    #landing on G2J(30) go to JAIL(10)
    elsif ($player_position == 30) {
      print "-> at $board_map[$player_position]($player_position)";
      $player_position = 10;
      print "goto $board_map[$player_position]($player_position)";
    }
  }
  $board[$player_position] = $board[$player_position] + 1;
}

#for my $i (0 .. $board_size-1) {
#  print "Square: $i --- Probability: ".(($board[$i]/($NUMBER_OF_MOVES*1.0)) * 100)."\n";
#}
#print "---\n";
#my $max = 0;
#my $max_i = 0;
#for my $i (0 .. $board_size-1) {
#  if ($board[$i] > $max) {
#    $max = $board[$i];
#    $max_i = $i;
#  }
#}
#print "The biggest percentage is at square: $max_i\n";
#$board[ $max_i ] = 0;
#$max = 0;
#$max_i = 0;
#for my $i (0 .. $board_size-1) {
#  if ($board[$i] > $max) {
#    $max = $board[$i];
#    $max_i = $i;
#  }
#}
#
#print "The second biggest percentage is at square: $max_i\n";
#$board[ $max_i ] = 0;
#$max = 0;
#$max_i = 0;
#for my $i (0 .. $board_size-1) {
#  if ($board[$i] > $max) {
#    $max = $board[$i];
#    $max_i = $i;
#  }
#}
#print "The third biggest percentage is at square: $max_i\n";

