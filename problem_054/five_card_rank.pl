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
#print "test have_same_value subroutine begin\n";
##my @arr=(1,2,3,4,5);
#my @arr=(1,2,2,4,5);
#if (have_same_value(@arr)) {
#  print "yes!\n";
#} else {
#  print "no!\n";
#}
#print "test have_same_value subroutine end\n";
#
sub max_value {
  my $max=0;
  for (my $i=0;$i<=$#_;$i++) {
    if ($_[$i] > $max) {
      $max=$_[$i];
    }
  }
  return $max;
}
#print "\n-----------------\n";
#print "test max_value subroutine begin\n";
##my @arr=(1,2,2,4,5);
#my @arr=(1,2,12,4,5);
#print max_value(@arr);
#print "\ntest max_value subroutine end\n";
sub card_max_value {
  return max_value(card_value(@_));
}
#print "test card_max_value subroutine begin\n";
#my @card1=("TD", "JC", "QS", "KH", "AC");
#print card_max_value(@card1);
#print "\ntest card_max_value subroutine end\n";

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
  #print join(":",@value),"\n";
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
#print "test same_type subroutine begin\n";
##my @arr=(1,1,2,4,6);
##my @arr=(1,1,1,4,6);
##my @arr=(1,1,4,4,6);
##my @arr=(1,1,1,4,4);
##my @arr=(1,1,1,1,4);
#if (same_type(@arr) == 1) {
#  print "have two same value card(2)\n";
#} elsif (same_type(@arr) == 3) {
#  print "have three same value(3)\n";
#} elsif (same_type(@arr) == 2) {
#  print "have two pair of two same value card(2+2)\n";
#} elsif (same_type(@arr) == 4) {
#  print "have two same value card and there same value card(3+2)\n";
#} elsif (same_type(@arr) == 6) {
#  print "have four same value card(4)\n";
#} else {
#  print "don't match anything!\n";
#  print same_type(@arr),"\n";
#}
#print "test same_type subroutine end\n";
sub card_same_type {
  return same_type(card_value(@_));
}
#print "test card_same_type subroutine begin\n";
##my @arr=("1H","1C","2C","4H","6S");
##my @arr=("1H","1C","1C","4H","6S");
##my @arr=("1H","1C","1C","1H","6S");
##my @arr=("1H","1C","2C","2H","6S");
##my @arr=("1H","1C","2C","2H","2S");
#if (card_same_type(@arr) == 1) {
#  print "have two same value card(2)\n";
#} elsif (card_same_type(@arr) == 3) {
#  print "have three same value(3)\n";
#} elsif (card_same_type(@arr) == 2) {
#  print "have two pair of two same value card(2+2)\n";
#} elsif (card_same_type(@arr) == 4) {
#  print "have two same value card and there same value card(3+2)\n";
#} elsif (card_same_type(@arr) == 6) {
#  print "have four same value card(4)\n";
#} else {
#  print "don't match anything!\n";
#  print card_same_type(@arr),"\n";
#}
#print "test card_same_type subroutine end\n";

#my $str="5H";
#$str =~ /^(\d)(\w)$/;
#print "$1 $2\n";
#test card_have_same_value(@card)
#my @card=("TH", "JC", "QS", "KS", "AD");
#my @card=("2D", "9C", "AS", "AH", "AC");
#my @card=("KD", "9C", "AS", "2H", "AC");
#my @card=("5H", "5C", "6S", "7S", "9D");
#my @card=("5H", "5C", "6S", "7S", "9D");
#my @card=("5H", "5H", "6H", "7H", "9H");
#card_have_same_value(@card);
#if (card_have_same_value(@card)) {
#  print "yes!\n";
#} else {
#  print "no!\n";
#}
#if (card_all_same_suit(@card)) {
#  print "yes!\n";
#} else {
#  print "no!\n";
#}

#my @card=("5H", "5C", "6S", "7S", "KD");
#my @card_value1=card_value(@card);
#print join(":",@card_value1);
#print "\n";
#
#my @card_suit1=card_suit(@card);
#print join(":",@card_suit1),"\n";
sub card_is_consecutive {
  my @value=card_value(@_);
  #print "@value\n";
  #my @sort_value=sort(@value);
  my @sort_value=sort {$a <=> $b } @value;
  for (my $i=0;$i<$#sort_value;$i++) {
    if ($sort_value[$i] + 1 != $sort_value[$i+1]) {
      return 0;
    }
  }
  #print "@sort_value\n";
  return 1;
}

#print "card_is_consecutive subroutine begin\n";
##my @card=("KD", "9C", "AS", "2H", "AC");
#my @card=("TD", "JC", "QS", "KH", "AC");
##card_is_consecutive(@card);
#if (card_is_consecutive(@card)) {
#  print "yes!\n";
#} else {
#  print "no!\n";
#}
#print "card_is_consecutive subroutine end\n";
#0    High Card: Highest value card.
#1    One Pair: Two cards of the same value.
#2    Two Pairs: Two different pairs.
#3    Three of a Kind: Three cards of the same value.
#4    Straight: All cards are consecutive values.
#5    Flush: All cards of the same suit.
#6    Full House: Three of a kind and a pair.
#7    Four of a Kind: Four cards of the same value.
#8    Straight Flush: All cards are consecutive values of same suit.
#9    Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

sub rank_of_card {
  if (card_have_same_value(@_)) {
    if (card_same_type(@_) == 1) {
      #1    One Pair: Two cards of the same value.
      #print "1    One Pair: Two cards of the same value.\n";
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
#print "test rank_of_card subroutine begin\n";
##my @card=("5H", "5C", "6S", "7S", "KD");
##my @card=("2C", "3S", "8S", "8D", "TD");
#
##my @card=("5D", "8C", "9S", "JS", "AC");
##my @card=("2C", "5C", "7D", "8S", "QH");
#
##my @card=("2D", "9C", "AS", "AH", "AC");
##my @card=("3D", "6D", "7D", "TD", "QD");
#
##my @card=("4D", "6S", "9H", "QH", "QC");
##my @card=("3D", "6D", "7H", "QD", "QS");
#
##my @card=("2H", "2D", "4C", "4D", "4S");
#my @card=("3C", "3D", "3S", "9S", "9D");
#print rank_of_card(@card);
#print "\ntest rank_of_card subroutine end\n";
sub value_compare {
  my @value1=();
  my @value2=();
  my $index=$_[0];
  for (my $i=1;$i<=$#_;$i++) {
    if ($i<=$index) {
      push(@value1,$_[$i]);
    } else {
      push(@value2,$_[$i]);
    }
  }
  my @sort_value1=sort {$b <=> $a} @value1;
  my @sort_value2=sort {$b <=> $a} @value2;
  print "@sort_value1\n";
  print "@sort_value2\n";
  for (my $i=0;$i<=$#sort_value1;$i++) {
    if ($sort_value1[$i]>$sort_value2[$i]) {
      return 1;
    } elsif ($sort_value1[$i]<$sort_value2[$i]) {
      return 0;
    }
  }
  print "\nhave same value\nThis is unexpect behave!";
  exit 1;
  return -1;
}
#print "test value_compare subroutine begin\n";
#my @value1=(1,3,4,5,9);
#my @value2=(1,8,4,5,6);
#print value_compare(5,@value1,@value2);
#print "test value_compare subroutine end\n";

sub weightest_keys {
  my $hash_ref=shift;
#  foreach (keys %{$hash_ref}) {
#    print $_, " : ",$hash_ref->{$_}, "\n";
#  }
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
  #print "\n$weightest_value\n";
  #print join(":", @weightest_key);
  #print "\n";
  return \@weightest_key;
}

#print "test weightest_keys subroutine begin\n";
#my %weighted_hash=(1=>3,2=>3,5=>2,7=>2,8=>1,9=>0,10=>0);
#foreach (keys %weighted_hash) {
#  print "(",$_," => ",$weighted_hash{$_},")--";
#}
#print "\n";
##print weightest_keys(\%weighted_hash);
#my $keys_ref = weightest_keys(\%weighted_hash);
#print join(":", @$keys_ref);
#print "\n";
#foreach (keys %weighted_hash) {
#  print "(",$_," => ",$weighted_hash{$_},")--";
#}
#print "\ntest weightest_keys subroutine end\n";

sub weighted_sort {
  my $hash_ref=shift;
  my %temp=%$hash_ref;
  #print %temp; print "\n";
  foreach (keys %temp) {
    print "(",$_," => ",$temp{$_},")\n";
  }
  #
  my @temp_keys=keys %temp;
  print join(":",@temp_keys);
  my $temp_keys_size=$#temp_keys+1;
  print "($temp_keys_size)\n";

  my @weighted_arr=();
  while ($temp_keys_size > 0) {

    my $keys_ref = weightest_keys(\%temp);
    push(@weighted_arr,sort {$b <=> $a} @$keys_ref);

    @temp_keys=keys %temp;
    $temp_keys_size=$#temp_keys+1;
    print join(":",@temp_keys);
    print "($temp_keys_size)\n";
  }
  return \@weighted_arr;
}
#print "test weighted_sort subroutine begin\n";
#my %weighted_hash=(1=>3,2=>3,5=>2,7=>2,8=>1,9=>0,10=>0);
#my $sort_ref=weighted_sort(\%weighted_hash);
#foreach (@$sort_ref) {
#  print "$_ -- ";
#}
#print "\n";
##weighted_sort shoud be 2,1,7,5,8,10,9
#print "test weighted_sort subroutine end\n";
sub compare_card {
  my @card1=();
  my @card2=();
  for (my $i=0;$i<=$#_;$i++) {
    if ($i<5) {
      push(@card1,$_[$i]);
    } else {
      push(@card2,$_[$i]);
    }
  }
  #print "@card1\n"; print "@card2\n";
  if (rank_of_card(@card1) > rank_of_card(@card2)) {
    print "rank_of_card(@card1) > rank_of_card(@card2)\n";
    return 1;
  } elsif (rank_of_card(@card1) < rank_of_card(@card2)) {
    print "rank_of_card(@card1) < rank_of_card(@card2)\n";
    return 0;
  } else {
    #print "rank_of_card(@card1) = rank_of_card(@card2)\n";
    #if (rank_of_card(@card1) == 0 or rank_of_card(@card1) == 5 or rank_of_card(@card1) == 4 or rank_of_card(@card1) == 8) {
    if (card_have_same_value(@card1)) {
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
      my @weighted_sort1=weighted_sort(\%weight_card1);
      my @weighted_sort2=weighted_sort(\%weight_card2);
      return value_compare($#weighted_sort1+1,@weighted_sort1,@weighted_sort2);
    } else {
      return value_compare(5,card_value(@card1),card_value(@card2));
    }
  }
}
print "\ntest compare_same_rank subroutine begin\n";
my $card_str="5H 5C 6S 7S KD 2C 3S 8S 8D TD";
my @card_pair=split(" ",$card_str);
print compare_card(@card_pair);
print "\ntest compare_same_rank subroutine end\n";
