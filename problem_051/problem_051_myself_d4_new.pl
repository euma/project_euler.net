use strict;
use warnings;

my $digit=4;
#my $digit=$ARGV[0];
my $limit=10**$digit-1;
#print "$limit\n";
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
my $start=10**($digit-1)+1;
my $start_index=($start-1)/2;
#my @pattern=('^(\d)\d$','^\d(\d)$');
my @pattern=(
  '^(\d\d)\d\d$',
  '^\d(\d\d)\d$',
  '^\d\d(\d\d$)',
);
foreach my $pa (@pattern) {
  my %seen=();
  for (my $i = $start_index;$i<=$sievebound;$i++) {
    if (not $seen{$i}) {
      if (not $sieve[$i]) {
        my $prime=2*$i+1;
        $prime =~ /$pa/;
        my $prime_1=$1;
        my $match_position=$-[1];
        $prime_1 =~ /^(\d)(\d)$/;
        if ($1 == $2) {
          my $tmp_prime=$prime;
          my @split_tmp_prime=split("",$tmp_prime);
          my @remain_prime=();
          for (my $k=0;$k<=$#split_tmp_prime;$k++) {
            if ($k == $match_position) { $k += 2; }
            if ($k <=$#split_tmp_prime) {
              push(@remain_prime,$split_tmp_prime[$k]);
            }
          }
          my $remain_number=join("",@remain_prime);
          my @replace_1=($prime);
          for (my $j = $i+1;$j<=$sievebound;$j++) {
            if (not $sieve[$j]) {
              my $prime2=2*$j+1;
              $prime2 =~ /$pa/;
              my $prime2_1=$1;
              $prime2_1 =~ /^(\d)(\d)$/;
              if ($1 == $2) {
                my $tmp_prime2=$prime2;
                my @split_tmp_prime2=split("",$tmp_prime2);
                my @remain_prime2=();
                for (my $h=0;$h<=$#split_tmp_prime2;$h++) {
                  if ($h == $match_position) { $h += 2; }
                  if ($h <=$#split_tmp_prime) {
                    push(@remain_prime2,$split_tmp_prime2[$h]);
                  }
                }
                my $remain_number2=join("",@remain_prime2);
                if ($remain_number == $remain_number2) {
                  $seen{$j}=1;
                  push(@replace_1,$prime2);
                }
              }
            }
          }
          print "@replace_1 -- ";
          print $#replace_1+1;
          print "\n-------------------\n";
        }
      }
    }
  }
}
my @pattern2=(
  '^(\d\d\d)\d$',
  '^\d(\d\d\d)$',
);
foreach my $pa (@pattern2) {
  my %seen=();
  for (my $i = $start_index;$i<=$sievebound;$i++) {
    if (not $seen{$i}) {
      if (not $sieve[$i]) {
        my $prime=2*$i+1;
        $prime =~ /$pa/;
        my $prime_1=$1;
        my $match_position=$-[1];
        $prime_1 =~ /^(\d)(\d)(\d)$/;
        if ($1 == $2 and $1 == $3) {
          my $tmp_prime=$prime;
          my @split_tmp_prime=split("",$tmp_prime);
          my @remain_prime=();
          for (my $k=0;$k<=$#split_tmp_prime;$k++) {
            if ($k == $match_position) { $k += 3; }
            if ($k <=$#split_tmp_prime) {
              push(@remain_prime,$split_tmp_prime[$k]);
            }
          }
          my $remain_number=join("",@remain_prime);
          my @replace_1=($prime);
          for (my $j = $i+1;$j<=$sievebound;$j++) {
            if (not $sieve[$j]) {
              my $prime2=2*$j+1;
              $prime2 =~ /$pa/;
              my $prime2_1=$1;
              $prime2_1 =~ /^(\d)(\d)(\d)$/;
              if ($1 == $2 and $1 == $3) {
                my $tmp_prime2=$prime2;
                my @split_tmp_prime2=split("",$tmp_prime2);
                my @remain_prime2=();
                for (my $h=0;$h<=$#split_tmp_prime2;$h++) {
                  if ($h == $match_position) { $h += 3; }
                  if ($h <=$#split_tmp_prime) {
                    push(@remain_prime2,$split_tmp_prime2[$h]);
                  }
                }
                my $remain_number2=join("",@remain_prime2);
                if ($remain_number == $remain_number2) {
                  $seen{$j}=1;
                  push(@replace_1,$prime2);
                }
              }
            }
          }
          print "@replace_1 -- ";
          print $#replace_1+1;
          print "\n-------------------\n";
        }
      }
    }
  }
}
