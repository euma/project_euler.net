use strict;
use warnings;


sub have_same_value {
  for (my $i=0;$i<=$#_;$i++) {
    for (my $j=$i+1;$j<=$#_;$j++) {
      if ($_[$i] == $_[$j]) {
	return 1;
      }
    }
  }
  return 0;
}
sub max_value {
  my $max=0;
  for (my $i=0;$i<=$#_;$i++) {
    if ($_[$i] > $max) {
      $max=$_[$i];
    }
  }
  return $max;
}
sub card_max_value {
  return max_value(card_value(@_));
}
sub card_divide {
  my @value=();
  my @suit=();
  foreach (@_) {
    my @split_card = split("",$_);
    if ($split_card[0] eq "T") {
      push(@value,10);
    }
    elsif ($split_card[0] eq "J") {
      push(@value,11);
    }
    elsif ($split_card[0] eq "Q") {
      push(@value,12);
    }
    elsif ($split_card[0] eq "K") {
      push(@value,13);
    }
    elsif ($split_card[0] eq "A") {
      push(@value,14);
    }
    else {
      push(@value,$split_card[0]);
    }
    push(@suit,$split_card[1]);
  }
  return (\@value,\@suit);

}
sub card_value {
  my ($value_ref,$suit_ref)=card_divide(@_);
  return @$value_ref;
}
sub card_suit {
  my ($value_ref,$suit_ref)=card_divide(@_);
  return @$suit_ref;
}
sub card_have_same_value {
  return have_same_value(card_value(@_));
}
sub card_all_same_suit {
  my @suit=card_suit(@_);
  my $first_suit=$suit[0];
  for (my $i=1;$i<=$#suit;$i++) {
    if ($suit[$i] ne $first_suit) {
      return 0;
    }
  }
  return 1;
}
sub same_type {
  my $total_same=0;
  for (my $i=0;$i<=$#_;$i++) {
    for (my $j=$i+1;$j<=$#_;$j++) {
      if ($_[$i] == $_[$j]) {
	$total_same++;
      }
    }
  }
  return $total_same;
}
sub card_same_type {
  return same_type(card_value(@_));
}
sub card_is_consecutive {
  my @value=card_value(@_);
  my @sort_value=sort {$a <=> $b } @value;
  for (my $i=0;$i<$#sort_value;$i++) {
    if ($sort_value[$i] + 1 != $sort_value[$i+1]) {
      return 0;
    }
  }
  return 1;
}
sub rank_of_card {
  if (card_have_same_value(@_)) {
    if (card_same_type(@_) == 1) {
      #1    One Pair: Two cards of the same value.
      return 1;
    } elsif (card_same_type(@_) == 3) {
      #3    Three of a Kind: Three cards of the same value.
      return 3;
    } elsif (card_same_type(@_) == 2) {
      #2    Two Pairs: Two different pairs.
      return 2;
    } elsif (card_same_type(@_) == 4) {
      #6    Full House: Three of a kind and a pair.
      return 6;
    } elsif (card_same_type(@_) == 6) {
      #7    Four of a Kind: Four cards of the same value.
      return 7;
    } else {
      return -1;
    }
  } else {
    if (card_is_consecutive(@_)) {
      if (card_all_same_suit(@_)) {
	if (card_max_value(@_) == 14) {
          #9    Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
	  return 9;
	} else {
          #8    Straight Flush: All cards are consecutive values of same suit.
	  return 8;
	}
      } else {
        #4    Straight: All cards are consecutive values.
	return 4;
      }
    }
    else {
      if (card_all_same_suit(@_)) {
        #5    Flush: All cards of the same suit.
	return 5;
      } else {
        #0    High Card: Highest value card.
        return 0;
      }
    }
  }
}
sub value_compare {
  my @value1=(); my @value2=();
  my $compare_type=$_[0];
  my $index=$_[1];
  for (my $i=2;$i<=$#_;$i++) {
    if ($i<=$index) {
      push(@value1,$_[$i]);
    } else {
      push(@value2,$_[$i]);
    }
  }
  print "@value1\n"; print "@value2\n";
  my @sort_value1=();
  my @sort_value2=();
  if ($compare_type == 0) {
    @sort_value1=sort {$b <=> $a} @value1;
    @sort_value2=sort {$b <=> $a} @value2;
  } elsif ($compare_type == 1) {
    #At this situation, I get weighted sort array, So they can't be resort!
    @sort_value1= @value1;
    @sort_value2= @value2;
  }
  my $max=$#sort_value1;
  if ($#sort_value1 > $#sort_value2) {
    $max=$#sort_value2;
  }
  for (my $i=0;$i<=$max;$i++) {
    if ($sort_value1[$i]>$sort_value2[$i]) {
      print "($sort_value1[$i]>$sort_value2[$i])";
      return 1;
    } elsif ($sort_value1[$i]<$sort_value2[$i]) {
      print "($sort_value1[$i]<$sort_value2[$i])";
      return 0;
    } else {
      print "($sort_value1[$i]==$sort_value2[$i])";
    }
  }
  print "\nhave same value\nThis is unexpect behave!";
  exit 1;
  return -1;
}
sub weightest_keys {
  my $hash_ref=shift;
  my $weightest_value=0;
  my @weightest_key=();
  foreach (keys %{$hash_ref}) {
    if ($hash_ref->{$_} > $weightest_value) {
      $weightest_value=$hash_ref->{$_};
    }
  }
  foreach (keys %{$hash_ref}) {
    if ($hash_ref->{$_} == $weightest_value) {
      push(@weightest_key,$_);
      delete $hash_ref->{$_};
    }
  }
  return \@weightest_key;
}
sub weighted_sort {
  my $hash_ref=shift;
  my %temp=%$hash_ref;
  my @temp_keys=keys %temp;
  my $temp_keys_size=$#temp_keys+1;

  my @weighted_arr=();
  while ($temp_keys_size > 0) {

    my $keys_ref = weightest_keys(\%temp);
    push(@weighted_arr,sort {$b <=> $a} @$keys_ref);

    @temp_keys=keys %temp;
    $temp_keys_size=$#temp_keys+1;
  }
  return \@weighted_arr;
}
sub card1wincard2 {
  my @card1=();
  my @card2=();
  for (my $i=0;$i<=$#_;$i++) {
    if ($i<5) {
      push(@card1,$_[$i]);
    } else {
      push(@card2,$_[$i]);
    }
  }
  #print "\n@card1\n"; print "@card2\n";#ok!
  if (rank_of_card(@card1) > rank_of_card(@card2)) {
    print "\n(>)";
    return 1;
  } elsif (rank_of_card(@card1) < rank_of_card(@card2)) {
    print "\n(<)";
    return 0;
  } else {
    print "\n(==)";
    if (card_have_same_value(@card1)) {
      print "(repeat)\n";
      my %weight_card1=();
      my %weight_card2=();
      my @card1_value=card_value(@card1);
      my @card2_value=card_value(@card2);
      for (my $i=0;$i<=$#card1_value;$i++) {
	$weight_card1{$card1_value[$i]}++;
      }
      for (my $i=0;$i<=$#card2_value;$i++) {
	$weight_card2{$card2_value[$i]}++;
      }
      foreach (keys %weight_card1) {
	print "($_=>$weight_card1{$_})";
      }
      print "\n";
      foreach (keys %weight_card2) {
	print "($_=>$weight_card2{$_})";
      }
      my $weighted_sort1_ref=weighted_sort(\%weight_card1);
      my $weighted_sort2_ref=weighted_sort(\%weight_card2);
      my $size=$#{$weighted_sort1_ref};
      return value_compare(1,$size+2,@$weighted_sort1_ref,@$weighted_sort2_ref);
    } else {
      print "(not repeat)\n";
      return value_compare(0,6,card_value(@card1),card_value(@card2));
    }
  }
}
#print "\ntest compare_same_rank subroutine begin\n";
#my $card_str="5H 5C 6S 7S KD 2C 3S 8S 8D TD";
#my @card_pair=split(" ",$card_str);
#print card1wincard2(@card_pair);
#print "\ntest compare_same_rank subroutine end\n";
open(my $in,  "<",  "poker.txt")  or die "Can't open input.txt: $!";
my $play1_win_time=0;
my $lines=0;
while (<$in>) {
  #chomp;
  chop;
  chop;
  print "$lines\n";
  $lines++;
  #print "$_\n";
#  my @card_pair=split(" ",$_);
  my @card_pair=split(" ",$_);
  my @play1_cards=();
  my @play2_cards=();
  my $index=0;
  foreach (@card_pair) {
    if ($index<5) {
      push(@play1_cards,$_);
    } else {
      push(@play2_cards,$_);
    }
    $index++;
  }
  print join(" ",sort @play1_cards); print "\n";
  print join(" ",sort @play2_cards); print "\n";
  if (card1wincard2(@card_pair)) {
    $play1_win_time++;
  }
  print "\n---------------------\n";
}
close $in or die "$in: $!";
print "\n$play1_win_time\n";
print "\n$lines\n";
