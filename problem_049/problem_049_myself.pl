use strict;
use warnings;

my $limit=9999;
my $sievebound = int(($limit-1) / 2);# last index of sieve
#print "$sievebound\n";
#sieve := new boolean array [1 .. sievebound] false
my @sieve=();
foreach (0 .. $sievebound) {
  push(@sieve,0);
}
#for (my $i=0;$i<=$#sieve;$i++) {
#  print "$i:$sieve[$i]\n";
#}
my $crosslimit = int((int(sqrt($limit)) -1) / 2);
#print "$crosslimit\n";
for (my $i=1;$i<=$crosslimit;$i++) {
  if (not $sieve[$i]) { #2*i+1 is prime, mark multiples
    for (my $j=2*$i*($i+1);$j<=$sievebound;$j += (2*$i+1)) {
      $sieve[$j] = 1;
    }
  }
}


sub is_permutation_pair {
  my ($m,$n) = @_;
  if (length($m) != length($n)) {
    #print "return reason:length not equal\n";
    return 0;
  } else {
    my %seen=();
    my @split_m=split("",$m);
    my @split_n=split("",$n);
    for (my $i=0;$i<=$#split_m;$i++) {
      my $not_match=0;
      for (my $j=0;$j<=$#split_n;$j++) {
        if ($split_m[$i] == $split_n[$j]) {
          #print join(" : ",@split_m),"\n";
          #print join(" : ",@split_n),"\n";
          $split_m[$i]=-1;
          $split_n[$j]=-1;
          last;
        } else {
          $not_match++;
        }
      }
      if ($not_match == $#split_n+1) {
        #print "return reason:don't find $split_m[$i] in (@split_n)\n";
        return 0;
      }
      #print "\n---------------\n";
    }
    foreach (@split_m) {
      if ($_ != -1) {
        #print "return reason:$_ in m(@split_m) is not -1\n";
        return 0;
      }
    }
    foreach (@split_n) {
      if ($_ != -1) {
        #print "return reason:$_ in n(@split_n) is not -1\n";
        return 0;
      }
    }
    return 1;
  }
}
#my $p1=1234; my $p2=1342;
#my $p1=12234; my $p2=1342;
#my $p1=1224; my $p2=1342;
#my $p1=1234; my $p2=1322;
#if (is_permutation_pair($p1,$p2)) {
#  print "permutation pair $p1,$p2\n";
#} else {
#  print "$p1,$p2(not)\n";
#}

#my @arr=(1,3,5,7);
sub print_arithmetic3 {
  my @test=@_;
  my %in_arr=();
  for my $i (@test) {
    #print $i,"\n";
    $in_arr{$i}=1;
  }
  for (my $i=0;$i<=$#test;$i++) {
    for (my $j=$i+2;$j<=$#test;$j++) {
      my $ij2=($test[$i]+$test[$j])/2;
      if ($in_arr{$ij2}) {
        print "$test[$i] $ij2 $test[$j]\n";
        print "$test[$i]$ij2$test[$j]\n";
      }
    }
  }
}
#print_arithmetic3(@arr);

my %seen=();
for (my $i = 500;$i<=$sievebound;$i++) {
  if (not $seen{$i}) {
    if (not $sieve[$i]) {
      my $prime1=2*$i+1;
      my @prime_perm=();
      my $i_times=0;
      my $first=1;
      for (my $j = $i+1;$j<=$sievebound;$j++) {
        if (not $sieve[$j]) {
          my $prime2=2*$j+1;
          if (is_permutation_pair($prime1,$prime2)) {
            $seen{$j}=1;
            #print "$prime2 -- ";
            if ($first) { push(@prime_perm,$prime1); $first=0; }
            push(@prime_perm,$prime2);
            $i_times++;
          }
        }
      }
      if ($i_times > 2) {
        #print "@prime_perm\n";
        print_arithmetic3(@prime_perm);
      }
    }
  }
}
print "\n";

