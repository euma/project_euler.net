use strict;
use warnings;

my $digit=6;
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
my @pattern=(
  '^(\d\d)\d\d\d\d$',
  '^\d(\d\d)\d\d\d$',
  '^\d\d(\d\d)\d\d$',
  '^\d\d\d(\d\d)\d$',
  '^\d\d\d\d(\d\d)$',
);

#all:
foreach my $pa (@pattern) {
  for (my $i = $start_index;$i<=$sievebound;$i++) {
      if (not $sieve[$i]) {
        my $prime=2*$i+1;
        $prime =~ /$pa/;
        my $prime_1=$1;
        my $match_position=$-[1];
        $prime_1 =~ /^(\d)(\d)$/;
        if ($1 == $2) {
          my $tmp_prime=$prime;
          my @split_tmp_prime=split("",$tmp_prime);
          my @prime_arr=();
          for (my $h=0;$h<=9;$h++) {
            my @replace_prime=();
            for (my $k=0;$k<=$#split_tmp_prime;$k++) {
              if ($k == $match_position) {
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                $k += 2;
              }
              if ($k <=$#split_tmp_prime) {
                push(@replace_prime,$split_tmp_prime[$k]);
              }
            }
            my $replace_number=join("",@replace_prime);
            if ($replace_number % 2 !=0) {
              my $test=($replace_number-1)/2;
              if (not $sieve[$test]) {
                push(@prime_arr,$replace_number);
              }
            }
          }
          if ($#prime_arr >= 7) {
            print "@prime_arr";
            print " -- size: ";
            print $#prime_arr+1;
            print "\n";
            #last all;
          }
          #print "@prime_arr";
          #print " -- size: ";
          #print $#prime_arr+1;
          #print "\n";
        }
      }
  }
}

my @pattern2=(
  '^(\d\d\d)\d\d\d$',
  '^\d(\d\d\d)\d\d$',
  '^\d\d(\d\d\d)\d$',
  '^\d\d\d(\d\d\d)$',
);
#all2:
foreach my $pa (@pattern2) {
  for (my $i = $start_index;$i<=$sievebound;$i++) {
      if (not $sieve[$i]) {
        my $prime=2*$i+1;
        $prime =~ /$pa/;
        my $match_position=$-[1];
        my $prime_1=$1;
        $prime_1 =~ /^(\d)(\d)(\d)$/;
        if ($1 == $2 and $1 == $3) {
          my $tmp_prime=$prime;
          my @split_tmp_prime=split("",$tmp_prime);
          my @prime_arr=();
          for (my $h=0;$h<=9;$h++) {
            my @replace_prime=();
            for (my $k=0;$k<=$#split_tmp_prime;$k++) {
              if ($k == $match_position) {
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                $k += 3;
              }
              if ($k <=$#split_tmp_prime) {
                push(@replace_prime,$split_tmp_prime[$k]);
              }
            }
            my $replace_number=join("",@replace_prime);
            if ($replace_number % 2 !=0) {
              my $test=($replace_number-1)/2;
              if (not $sieve[$test]) {
                push(@prime_arr,$replace_number);
              }
            }
          }
          if ($#prime_arr >= 7) {
            print "@prime_arr";
            print " -- size: ";
            print $#prime_arr+1;
            print "\n";
            #last all2;
          }

          #print "@prime_arr";
          #print " -- size: ";
          #print $#prime_arr+1;
          #print "\n";
        }
      }
  }
}
my @pattern3=(
  '^(\d\d\d\d)\d\d$',
  '^\d(\d\d\d\d)\d$',
  '^\d\d(\d\d\d\d)$',
);
#all3:
foreach my $pa (@pattern3) {
  for (my $i = $start_index;$i<=$sievebound;$i++) {
      if (not $sieve[$i]) {
        my $prime=2*$i+1;
        $prime =~ /$pa/;
        my $match_position=$-[1];
        my $prime_1=$1;
        $prime_1 =~ /^(\d)(\d)(\d)(\d)$/;
        if ($1 == $2 and $1 == $3 and $1 == $4) {
          my $tmp_prime=$prime;
          my @split_tmp_prime=split("",$tmp_prime);
          my @prime_arr=();
          for (my $h=0;$h<=9;$h++) {
            my @replace_prime=();
            for (my $k=0;$k<=$#split_tmp_prime;$k++) {
              if ($k == $match_position) {
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                $k += 4;
              }
              if ($k <=$#split_tmp_prime) {
                push(@replace_prime,$split_tmp_prime[$k]);
              }
            }
            my $replace_number=join("",@replace_prime);
            if ($replace_number % 2 !=0) {
              my $test=($replace_number-1)/2;
              if (not $sieve[$test]) {
                push(@prime_arr,$replace_number);
              }
            }
          }
          if ($#prime_arr >= 7) {
            print "@prime_arr";
            print " -- size: ";
            print $#prime_arr+1;
            print "\n";
            #last all3;
          }

          #print "@prime_arr";
          #print " -- size: ";
          #print $#prime_arr+1;
          #print "\n";
        }
      }
  }
}
my @pattern4=(
  '^(\d\d\d\d\d)\d$',
  '^\d(\d\d\d\d\d)$',
);
#all4:
foreach my $pa (@pattern4) {
  for (my $i = $start_index;$i<=$sievebound;$i++) {
      if (not $sieve[$i]) {
        my $prime=2*$i+1;
        $prime =~ /$pa/;
        my $match_position=$-[1];
        my $prime_1=$1;
        $prime_1 =~ /^(\d)(\d)(\d)(\d)(\d)$/;
        if ($1 == $2 and $1 == $3 and $1 == $4 and $1 == $5) {
          my $tmp_prime=$prime;
          my @split_tmp_prime=split("",$tmp_prime);
          my @prime_arr=();
          for (my $h=0;$h<=9;$h++) {
            my @replace_prime=();
            for (my $k=0;$k<=$#split_tmp_prime;$k++) {
              if ($k == $match_position) {
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                push(@replace_prime,$h);
                $k += 5;
              }
              if ($k <=$#split_tmp_prime) {
                push(@replace_prime,$split_tmp_prime[$k]);
              }
            }
            my $replace_number=join("",@replace_prime);
            if ($replace_number % 2 !=0) {
              my $test=($replace_number-1)/2;
              if (not $sieve[$test]) {
                push(@prime_arr,$replace_number);
              }
            }
          }
          if ($#prime_arr >= 7) {
            print "@prime_arr";
            print " -- size: ";
            print $#prime_arr+1;
            print "\n";
            #last all4;
          }

          #print "@prime_arr";
          #print " -- size: ";
          #print $#prime_arr+1;
          #print "\n";
        }
      }
  }
}
