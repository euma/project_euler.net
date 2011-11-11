use strict;
use warnings;
use Math::BigInt;

#55374: 36325300925435785930832331577396761646715836173633893227071086460709268608053489541731404543537668438991170680745272159154493740615385823202158167635276250554555342115855424598920159035413044811245082197335097953570911884252410730174907784762924663654000000


#a recurrence for the partition function stating that:
#
#    p(k) = p(k − 1) + p(k − 2) − p(k − 5) − p(k − 7) + p(k − 12) + p(k − 15) − p(k − 22) − ...
#
#where p(0) is taken to equal 1, p(k) is zero for negative k, and the sum is taken over all generalized pentagonal numbers of the form ½n(3n − 1), for n running over positive and negative integers: successively taking n = 1, −1, 2, −2, 3, −3, 4, −4 ..., generates the values 1, 2, 5, 7, 12, 15, 22, 26, 35, 40, 51, .... The signs in the summation continue to alternate +, +, −, −, +, +, ...
my $target=$ARGV[0];
#open(my $log, ">>", "/home/vhv/my.log")     or die "Can't open my.log: $!";
#open(my $log, ">", "/home/vhv/my.log")     or die "Can't open my.log: $!";
open(my $in,  "<",  "/home/vhv/my.log")  or die "Can't open input.txt: $!";

my @p=();
my $count=0;
my $bcount = Math::BigInt->new("$count");


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

print "\ncome from file:\n";
while (<$in>) {     # assigns each line in turn to $_
  $p[$count]= Math::BigInt->new("$_");
  print "$count $p[$count]\n";
  $pi_mod = $p[$count]->copy();
  $pi_mod->bmod($n1000);
  if ($pi_mod->is_zero()) {
    print "$count $p[$count]\n";
    print "\nfind!\n"; last;
  }
  $count++;
}
close $in or die "$in: $!";

open(my $log, ">>", "/home/vhv/my.log")     or die "Can't open my.log: $!";
print "\ncome from compute:\n";
for (my $k=$count;$k<=$target;$k++) {
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
  #print "$k: $p[$k]\n";
  print $log "$p[$k]\n";

  $pi_mod = $p[$k]->copy();
  $pi_mod->bmod($n1000);
  if ($pi_mod->is_zero()) {
    print "$k: $p[$k]\n";
    print "\nfind!\n"; last;
  }
}
