my %days_of_month = (
  1=>31,
  2=>28,
  3=>31,
  4=>30,
  5=>31,
  6=>30,
  7=>31,
  8=>31,
  9=>30,
  10=>31,
  11=>30,
  12=>31);
sub is_leap_year {
  my $year=shift;
  if ($year % 4 == 0) {
    if ($year % 400 == 0) { return 1; }
    elsif ($year % 100 == 0) { return 0; }
    else { return 1; }
  } else {
    return 0;
  }
}
my $sum_days=0;
my @total_message;
for (my $year=1901;$year<=2000;$year++) {
  if (is_leap_year($year)) {
    #print " -- $year -- \n";
    $days_of_month{2}=29;
  } else {
    $days_of_month{2}=28;#must add! otherwise the total days from 1901_01_01 to 2000_12_31 will wrong!
  }
  
  for (my $month=1;$month<=12;$month++) {
    my @tmp=();
    push(@tmp,$year);
    push(@tmp,$month);
    push(@tmp,$sum_days);
    push(@total_message,\@tmp);
    $sum_days += $days_of_month{$month};
  }
}
#print $sundays=0;
#for (my $i=0;$i<=$#month_first;$i++) {
#  if ($month_first[$i] % 7 == 5) { $sundays++; }
#}
#print "\n----------------\n";
#print $sundays,"\n";

@sunday_total=();
foreach my $elem (@total_message) {
  my $i=0;
  my $is_push=0;
  foreach my $subelem (@{$elem}) {
    if (($i == 2) && ($subelem % 7 == 5)) {
      $is_push=1;
    } else {
      $is_push=0;
    }
    $i++;
  }
  #print $elem,"\n";
  if ($is_push) { push(@sunday_total,$elem); }
}
foreach my $elem (@sunday_total) {
  foreach my $subelem (@{$elem}) {
    print $subelem," -- ";
  }
  print "\n";
}
