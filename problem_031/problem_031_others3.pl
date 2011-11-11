#(define (count-change amount)
#  (cc amount 5))
#(define (cc amount kinds-of-coins)
#  (cond ((= amount 0) 1)
#        ((or (< amount 0) (= kinds-of-coins 0)) 0)
#        (else (+ (cc amount
#                     (- kinds-of-coins 1))
#                 (cc (- amount
#                        (first-denomination kinds-of-coins))
#                     kinds-of-coins)))))
#
#(define (first-denomination kinds-of-coins)
#  (cond ((= kinds-of-coins 1) 1)
#        ((= kinds-of-coins 2) 5)
#        ((= kinds-of-coins 3) 10)
#        ((= kinds-of-coins 4) 25)
#        ((= kinds-of-coins 5) 50)))
sub first_denomination {
  my $kinds_of_coins=shift;
  if ($kinds_of_coins == 1) {
    return 1;
  } elsif ($kinds_of_coins == 2) {
    return 2;
  } elsif ($kinds_of_coins == 3) {
    return 5;
  } elsif ($kinds_of_coins == 4) {
    return 10;
  } elsif ($kinds_of_coins == 5) {
    return 20;
  } elsif ($kinds_of_coins == 6) {
    return 50;
  } elsif ($kinds_of_coins == 7) {
    return 100;
  } elsif ($kinds_of_coins == 8) {
    return 200;
  }
}
sub cc {
  my ($amount, $kinds_of_coins)=@_;
  if ($amount == 0) {
    return 1;
  } elsif (($amount < 0) or ($kinds_of_coins == 0)) {
    return 0;
  } else {
    return cc($amount,$kinds_of_coins - 1) + cc(($amount - first_denomination($kinds_of_coins)),$kinds_of_coins);
  }
}
sub count_change {
  my $amount=shift;
  return cc($amount, 8);
}
print count_change(200),"\n";
