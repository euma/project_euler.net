sub take_community_chess_card {
  if ($community_chess_card_position==3) {
    $player_position = 0;
  }
  elsif($community_chess_card_position==9) {
    $player_position = 10;
  }
  $community_chess_card_position += 1;
  if ( $community_chess_card_position == 12) {
    $community_chess_card_position = 0
  }
}
sub take_chance_card {
  if($chance_card_position==0) {
    $player_position = 0;
  }
  elsif($chance_card_position==1) {
    $player_position = 10;
  }
  elsif($chance_card_position==2) {
    $player_position = 11;
  }
  elsif($chance_card_position==3) {
    $player_position = 24;
  }
  elsif($chance_card_position==4) {
    $player_position = 39;
  }
  elsif($chance_card_position==5) {
    $player_position = 5;
  }
  elsif($chance_card_position==6 or $chance_card_position==7) {
    if ($player_position < 5) {
      $player_position = 5;
    }
    elsif ($player_position < 15) {
      $player_position = 15;
    }
    elsif ($player_position < 25) {
      $player_position = 25;
    }
    elsif (@player_position < 35) {
      $player_position = 35;
    }
    else {
      $player_position = 5;
    }
  }
  elsif($chance_card_position==8) {
    if ($player_position < 12) {
      $player_position = 12;
    }
    elsif ($player_position < 28) {
      $player_position = 28;
    }
    else {
      $player_position = 12;
    }
  }
  elsif($chance_card_position==9) {
    $player_position = $player_position - 3;
    if ($player_position == 33) {
      take_community_chess_card();
    }
  }
  $chance_card_position += 1;
  if ( $chance_card_position == 12) {
    $chance_card_position = 0;
  }
}

my @board=();

for my $i (0 .. 39) {
  $board[$i] = 0;
}

our $player_position = 0;
our $community_chess_card_position = 0;
our $chance_card_position = 0;

my $number_of_doubles = 0;
my $size_of_dice = 4;

#my $NUMBER_OF_MOVES = 100000000;
my $NUMBER_OF_MOVES = 100;

for my $i (1 .. $NUMBER_OF_MOVES) {
  my $dice1 = int(rand($size_of_dice)) + 1;
  my $dice2 = int(rand($size_of_dice)) + 1;
  if ($dice1 == $dice2) {
    $number_of_doubles += 1;
  }
  if ($number_of_doubles == 3) {
    $player_position = 10;
  }
  else {
    $player_position += ($dice1 + $dice2);
    if ($player_position > 39) {
      $player_position = $player_position - 40;
    }
    elsif ($player_position == 2 or $player_position == 17 or $player_position == 33) {
      take_community_chess_card();
    }
    elsif ($player_position == 7 or $player_position == 22 or $player_position == 36) {
      take_chance_card();
    }
    elsif ($player_position == 30) {
      $player_position = 10;
    }
  }
  $board[$player_position] = $board[$player_position] + 1;
}

for my $i (0 .. 39) {
  print "Square: $i --- Probability: ".(($board[$i]/($NUMBER_OF_MOVES*1.0)) * 100)."\n";
}
print "---\n";
my $max = 0;
my $max_i = 0;
for my $i (0 .. 39) {
  if ($board[$i] > $max) {
    $max = $board[$i];
    $max_i = $i;
  }
}
print "The biggest percentage is at square: $max_i\n";
$board[ $max_i ] = 0;
$max = 0;
$max_i = 0;
for my $i (0 .. 39) {
  if ($board[$i] > $max) {
    $max = $board[$i];
    $max_i = $i;
  }
}

print "The second biggest percentage is at square: $max_i\n";
$board[ $max_i ] = 0;
$max = 0;
$max_i = 0;
for my $i (0 .. 39) {
  if ($board[$i] > $max) {
    $max = $board[$i];
    $max_i = $i;
  }
}
print "The third biggest percentage is at square: $max_i\n";
