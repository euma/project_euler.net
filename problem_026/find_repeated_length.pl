@arr=(0,1,3,2,1,3,2);
my $n=4;

my @arr_first_come;
my @arr_second_come;
my @arr_count;
foreach (0 .. $n-1) {
  push(@arr_first_come,0);
  push(@arr_second_come,0);
  push(@arr_count,0);
}
foreach (@arr) {
  if (not $arr_first_come[$_]) {
    $arr_first_come[$_]=1;
  } elsif ( $arr_first_come[$_] and not $arr_second_come[$_]) {
    $arr_second_come[$_]=1;
  }
  if ($arr_second_come[$_]) { print "\n$_\n"; last; }
  for (my $i=0;$i<$n;$i++) {
    if ($arr_first_come[$i]) {
      $arr_count[$i]++;
    }
  }
}
print join(" -- ",@arr);
print "\n---------------\n";
print join(" -- ",@arr_first_come);
print "\n---------------\n";
print join(" -- ",@arr_second_come);
print "\n---------------\n";
print join(" -- ",@arr_count);
print "\n---------------\n";
