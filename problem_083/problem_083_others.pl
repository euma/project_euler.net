##include <iostream>
##include <cstdio>
##include <algorithm>
##define n 80
#using namespace std;
# 
#int a[n + 1][n + 1];
#int dp[n + 1][n + 1];
#int dir[4][2] = { 1, 0, -1, 0, 0, 1, 0, -1 };
# 
#int main()
#{
#        freopen("matrix.txt", "r", stdin);
#        int i, j, k;
#        for (i = 0; i < n; i++)
#                for (j = 0; j < n; j++) {
#                        scanf("%d", &a[i][j]);
#                        if (j == 0 && i == 0) {
#                                dp[i][j] = a[i][j];
#                        } else {
#                                dp[i][j] = 26032400;
#                        }
#                }
#        for (i = 0; i < n; i++)
#                for (j = 0; j < n; j++)
#                        // printf("%d%s", dp[i][j], j==n-1?"\n":" ");
#                        for (k = 0; k < 4; k++)
#                                printf("%d %d\n", dir[k][0], dir[k][1]);
#        for (int z = 0; z < n; z++)
# 
#                for (j = 0; j < n; j++) {
# 
#                        for (i = 0; i < n; i++) {
#                                for (k = 0; k < 4; k++) {
#                                        if (i + dir[k][0] >= 0
#                                            && j + dir[k][1] < n
#                                            && i + dir[k][0] < n
#                                            && j + dir[k][1] >= 0) {
#                        dp[i + dir[k][0]][j + dir[k][1]] = min(dp[i][j] + a[i + dir[k][0]][j + dir[k][1]], dp[i + dir[k][0]][j +dir[k][1]]);
#                                        }
#                                }
#                        }
#                }
#        int Min = dp[0][n - 1];
#        for (i = 0; i < n; i++)
#                if (Min > dp[i][n - 1])
#                        Min = dp[i][n - 1];
#        printf("%d\n", dp[n - 1][n - 1]);
#        // for (j=0; j<n; j++)
#        // printf("%d%s", dp[i][n-1], j==n-1?"\n":" ");
#}
use strict;
use warnings;
sub min {
  my $a=shift;
  my $b=shift;
  if ($a > $b) { return $b; }
  else { return $a; }
}
my @dir=([1, 0], [-1, 0], [0, 1], [0, -1]);
#[1, 0] right
#[-1, 0] left
#[0, 1] up
#[0, -1] down
open(my $in,  "<",  "matrix_5.txt")  or die "Can't open input.txt: $!";
my @a=();
my @dp=();
my $i=0;
while (<$in>) {
  my $line=$_;
  chomp($line);
  $line =~ tr/,/ /;
  my @row=split(' ',$line);
  #push(@matrix,\@row);
  for (my $j = 0; $j <= $#row; $j++) {
    $a[$i][$j]=$row[$j];
    if ($j == 0 && $i == 0) {
      $dp[$i][$j] = $a[$i][$j];
    } else {
      $dp[$i][$j] = 26032400;
      #$dp[$i][$j] = 'inf'; #$dp[$i][$j] = INF; #$dp[$i][$j]='Infinity';
    }
  }
  $i++;
}
close $in or die "$in: $!";
my $n=$i;
print "$n\n";
for my $i ( 0 .. $#a) {
  for my $j ( 0 .. $#{$a[$i]} ) {
    printf("%3d ",$a[$i][$j]);
  }
  print "\n";
}
for my $i ( 0 .. $#dp) {
  for my $j ( 0 .. $#{$dp[$i]} ) {
    printf("%3d ",$dp[$i][$j]);
  }
  print "\n";
}
for (my $i = 0; $i < $n; $i++) {
  for (my $j = 0; $j < $n; $j++) {
    printf("%d%s", $dp[$i][$j], $j==$n-1?"\n":" ");
    for (my $k = 0; $k < 4; $k++) {
      printf("%d %d\n", $dir[$k][0], $dir[$k][1]);
    }
  }
}
for (my $z = 0; $z < $n; $z++) {
  for (my $j = 0; $j < $n; $j++) {
    for (my $i = 0; $i < $n; $i++) {
      for (my $k = 0; $k < 4; $k++) {
        if ($i + $dir[$k][0] >= 0 && $j + $dir[$k][1] < $n && $i + $dir[$k][0] < $n && $j + $dir[$k][1] >= 0) {
          $dp[$i + $dir[$k][0]][$j + $dir[$k][1]] = min($dp[$i][$j] + $a[$i + $dir[$k][0]][$j + $dir[$k][1]], $dp[$i + $dir[$k][0]][$j +$dir[$k][1]]);
        }
      }
    }
  }
}
my $Min = $dp[0][$n - 1];
for (my $i = 0; $i < $n; $i++) {
  if ($Min > $dp[$i][$n - 1]) {
    $Min = $dp[$i][$n - 1];
    printf("%d\n", $dp[$n - 1][$n - 1]);
    for (my $j=0; $j<$n; $j++) {
      printf("%d%s", $dp[$i][$n-1], $j==$n-1?"\n":" ");
    }
  }
}
print "\n$Min\n";
