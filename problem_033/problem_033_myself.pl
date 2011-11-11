use strict;
use warnings;

sub gcf {
  my ($x, $y) = @_;
  ($x, $y) = ($y, $x % $y) while $y;
  return $x;
}

sub lcm {
  return($_[0] * $_[1] / gcf($_[0], $_[1]));
}

sub multigcf {
  my $x = shift;
  $x = gcf($x, shift) while @_;
  return $x;
}

sub multilcm {
  my $x = shift;
  $x = lcm($x, shift) while @_;
  return $x;
}

sub fix_size_perm {
  my ($size, @list) = @_;
  my @curr = (0) x ($size - 1);
  push @curr, -1;
  return sub {
    if ( (join '', map { $list[ $_ ] } @curr) eq $list[ -1 ] x @curr ) {
      @curr = (0) x (@curr + 1);
    } else {
      my $pos = @curr;
      while ( --$pos > -1 ) {
         ++$curr[ $pos ], last if $curr[ $pos ] < $#list;
         $curr[ $pos ] = 0;
      }
    }
    return undef if @curr > $size;
    return join '', map { $list[ $_ ] } @curr;
  };
}
my $size = 2;
#my $next_perm = fix_size_perm($size, 'a'..'z', 0..9);
my @arr = ();
my $next_perm = fix_size_perm($size, 1 .. 9);
while ( my $perm = $next_perm->() ) {
    push(@arr,$perm);
}
my @den_arr=();
my $prod_num=1;
my $prod_den=1;
#print join(" -- ",@arr),"\n";
for (my $i=0;$i<=$#arr;$i++) {
  for (my $j=($i+1);$j<=$#arr;$j++) {
    #print "$arr[$i] $arr[$j]\n";
    $arr[$i] =~ /^(\d)(\d)$/;
    my ($tmp_1,$tmp_2)=($1,$2);
    $arr[$j] =~ /^(\d)(\d)$/;
    my ($tm_1,$tm_2)=($1,$2);
    my ($num,$den)=($tmp_1,$tm_2);

    if ($tmp_2 == $tm_1) {
      #if ($arr[$i]/$arr[$j] == $num/$den) {
      if (abs($arr[$i]/$arr[$j] - $num/$den) < 1e-6) {
        #print "$arr[$i]/$arr[$j] = ";
        #print $arr[$i]/$arr[$j];
        #print " = $num/$den = ";
        #print $num/$den,"\n";

        $prod_num *= $arr[$i];
        $prod_den *= $arr[$j];
        push(@den_arr,$arr[$j]);
      }
    }
  }
}
print join(" -- ",@den_arr),"\n";
print "\n",multilcm(@den_arr),"\n";
print "\n$prod_num/$prod_den\n";
print "\n",$prod_num/gcf($prod_num,$prod_den);
print "/",$prod_den/gcf($prod_num,$prod_den),"\n";
