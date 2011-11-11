use strict;
use warnings;
use Math::BigInt;

#a recurrence for the partition function stating that:
#
#    p(k) = p(k − 1) + p(k − 2) − p(k − 5) − p(k − 7) + p(k − 12) + p(k − 15) − p(k − 22) − ...
#
#where p(0) is taken to equal 1, p(k) is zero for negative k, and the sum is taken over all generalized pentagonal numbers of the form ½n(3n − 1), for n running over positive and negative integers: successively taking n = 1, −1, 2, −2, 3, −3, 4, −4 ..., generates the values 1, 2, 5, 7, 12, 15, 22, 26, 35, 40, 51, .... The signs in the summation continue to alternate +, +, −, −, +, +, ...
my $target=$ARGV[0];

my @p=();
$p[0]= Math::BigInt->bone();

my $three = Math::BigInt->new("3");
my $two = Math::BigInt->new("2");
my $pi = Math::BigInt->new("0");
my $bk_pi = Math::BigInt->new("0");
my $pi_mod = Math::BigInt->new("0");
my $n1000 = Math::BigInt->new("1000000");
#my $n1000 = Math::BigInt->new("100000");# 11224: 134664723242887520089229243811393012549783715496870074127499761107322501027469760957809248421625196998368711300000
#my $n1000 = Math::BigInt->new("10000"); #599: 435350207840317348270000
#my $n1000 = Math::BigInt->new("1000"); #449: 126891542690981418000
#my $n1000 = Math::BigInt->new("100"); #74: 7089500
#my $n1000 = Math::BigInt->new("10"); #9: 30


for (my $k=1;$k<=$target;$k++) {
  print "$k\n";
  my $i= Math::BigInt->bone();
  my $bk= Math::BigInt->new("$k");
  $p[$k] = Math::BigInt->new("0");
  while (1) {
    #my $pi=(3*$i*$i-$i)/2;
    my $i2= $i->copy();
    $i2->bmul($i2);
    $i2->bmul($three);

    $pi->bzero();
    $pi->badd($i2);
    $pi->bsub($i);
    $pi->bdiv($two);

    #if ($k-$pi < 0) { last; }
    $bk_pi=$bk->copy();
    $bk_pi->bsub($pi);
    if ($bk_pi->is_neg()) { last; }

    #$p[$k] += $p[$k-$pi];
    $p[$k]->badd($p[$bk_pi]);

    #$pi=(3*$i*$i+$i)/2;
    $pi->bzero();
    $pi->badd($i2);
    $pi->badd($i);
    $pi->bdiv($two);

    #if ($k-$pi < 0) { last; }
    $bk_pi=$bk->copy();
    $bk_pi->bsub($pi);
    if ($bk_pi->is_neg()) { last; }


    #$p[$k] += $p[$k-$pi];
    $p[$k]->badd($p[$bk_pi]);

    #$i++;
    $i->binc();

    #$pi=(3*$i*$i-$i)/2;
    $i2= $i->copy();
    $i2->bmul($i2);
    $i2->bmul($three);
    $pi->bzero();
    $pi->badd($i2);
    $pi->bsub($i);
    $pi->bdiv($two);

    #if ($k-$pi < 0) { last; }
    $bk_pi=$bk->copy();
    $bk_pi->bsub($pi);
    if ($bk_pi->is_neg()) { last; }

    #$p[$k] += -$p[$k-$pi];
    $p[$k]->bsub($p[$bk_pi]);

    #$pi=(3*$i*$i+$i)/2;
    $pi->bzero();
    $pi->badd($i2);
    $pi->badd($i);
    $pi->bdiv($two);

    #if ($k-$pi < 0) { last; }
    $bk_pi=$bk->copy();
    $bk_pi->bsub($pi);
    if ($bk_pi->is_neg()) { last; }

    #$p[$k] += -$p[$k-$pi];
    $p[$k]->bsub($p[$bk_pi]);

    #$i++;
    $i->binc();
  }
  $pi_mod = $p[$k]->copy();
  $pi_mod->bmod($n1000);
  if ($pi_mod->is_zero()) {
    print "$k: $p[$k]\n";
    print "\nfind!\n";
    last;
  }
}
