use strict;
use warnings;

$DB::deep=400;
open(my $in,  "<",  "matrix.txt")  or die "Can't open input.txt: $!";
my @matrix=();
while (<$in>) {
  my $line=$_;
  chomp($line);
  $line =~ tr/,/ /;
  my @row=split(' ',$line);
  push(@matrix,\@row);
}
close $in or die "$in: $!";
print "\n----------part 1 get matrix----------\n";
#for my $i ( 0 .. $#matrix ) {
#  for my $j ( 0 .. $#{$matrix[$i]} ) {
#    printf("%3d ",$matrix[$i][$j]);
#  }
#  print "\n";
#}
print "\n----------part 2----------\n";
sub next_min {
  my ($current_min,$current_i,$current_j,$come_from)=@_;
  my $i1=$current_i-1;
  my $j1=$current_j;
  my $i2=$current_i+1;
  my $j2=$current_j;
  my $i3=$current_i;
  my $j3=$current_j-1;
  #add don't go back
  if ($come_from==1) {
    #don't go 2 so compare 1 and 3
    if ($i1>=0 and ($matrix[$i1][$j1] <= $matrix[$i3][$j3])) {
      print "+($i1,$j1)=$matrix[$i1][$j1]";
      return ($matrix[$i1][$j1]+$current_min, $i1, $j1, 1);
    }
    else {
      print "+($i3,$j3)=$matrix[$i3][$j3]";
      return ($matrix[$i3][$j3]+$current_min, $i3, $j3, 3);
    }
  }
  elsif ($come_from==2) {
    #don't go 1 so compare 2 and 3
    if ($i2<=$#matrix and ($matrix[$i2][$j2] <= $matrix[$i3][$j3])) {
      print "+($i2,$j2)=$matrix[$i2][$j2]";
      return ($matrix[$i2][$j2]+$current_min, $i2, $j2, 2);
    }
    else {
      print "+($i3,$j3)=$matrix[$i3][$j3]";
      return ($matrix[$i3][$j3]+$current_min, $i3, $j3, 3);
    }
  }
  else {
    #for most situation is ok!
    if ($i1>=0) {
      if ($i2<=$#matrix) {
        #compare 1 2 3
        if (($matrix[$i1][$j1] <= $matrix[$i2][$j2]) and ($matrix[$i1][$j1] <= $matrix[$i3][$j3])) {
          print "+($i1,$j1)=$matrix[$i1][$j1]";
          return ($matrix[$i1][$j1]+$current_min, $i1, $j1, 1);
        }
        elsif (($matrix[$i2][$j2] <= $matrix[$i1][$j1]) and ($matrix[$i2][$j2] <= $matrix[$i3][$j3])) {
          print "+($i2,$j2)=$matrix[$i2][$j2]";
          return ($matrix[$i2][$j2]+$current_min, $i2, $j2, 2);
        }
        #elsif (($matrix[$i3][$j3] <= $matrix[$i1][$j1]) and ($matrix[$i3][$j3] <= $matrix[$i2][$j2])) {
        else {
          print "+($i3,$j3)=$matrix[$i3][$j3]";
          return ($matrix[$i3][$j3]+$current_min, $i3, $j3, 3);
        }
      }
      else {
        #compare 1 3
        if ($matrix[$i1][$j1] <= $matrix[$i3][$j3]) {
          print "+($i1,$j1)=$matrix[$i1][$j1]";
          return ($matrix[$i1][$j1]+$current_min, $i1, $j1, 1);
        }
        else {
          print "+($i3,$j3)=$matrix[$i3][$j3]";
          return ($matrix[$i3][$j3]+$current_min, $i3, $j3, 3);
        }
      }
    }
    else {
      if ($i2<=$#matrix) {
        #compare 2 3
        if ($matrix[$i2][$j2] <= $matrix[$i3][$j3]) {
          print "+($i2,$j2)=$matrix[$i2][$j2]";
          return ($matrix[$i2][$j2]+$current_min, $i2, $j2, 2);
        }
        else {
          print "+($i3,$j3)=$matrix[$i3][$j3]";
          return ($matrix[$i3][$j3]+$current_min, $i3, $j3, 3);
        }
      }
      else {
        #return 3
        print "+($i3,$j3)=$matrix[$i3][$j3]";
        return ($matrix[$i3][$j3]+$current_min, $i3, $j3, 3);
      }
    }
  }
}

#test next_min subroutine
#my ($current_min,$current_i,$current_j,$current_come_from)=(15,2,4,0);
#print "($current_min,$current_i,$current_j,$current_come_from)\n";
#my ($next_min,$next_i,$next_j,$next_come_from)=next_min($current_min,$current_i,$current_j,$current_come_from);
#print "($next_min,$next_i,$next_j,$next_come_from)\n";
#($next_min,$next_i,$next_j,$next_come_from)=next_min($next_min,$next_i,$next_j,$next_come_from);
#print "($next_min,$next_i,$next_j,$next_come_from)\n";
#($next_min,$next_i,$next_j,$next_come_from)=next_min($next_min,$next_i,$next_j,$next_come_from);
#print "($next_min,$next_i,$next_j,$next_come_from)\n";

print "\n----------part 3----------\n";
my $deep_recursion=0;
sub matrix_min_sum {
  my $current_min=shift;
  my $current_i=shift;
  my $current_j=shift;
  my $current_come_from=shift;

  $deep_recursion++;
  if ($current_j==0) {
    return $current_min;
  }
  else {
    my ($next_min,$next_i,$next_j,$next_come_from)=next_min($current_min,$current_i,$current_j,$current_come_from);

    print "---matrix_min_sum($current_min, $current_i, $current_j,$current_come_from)\n";
    matrix_min_sum($next_min,$next_i,$next_j,$next_come_from);
  }
}
my $all_path_min=10**8;
#for (my $i=0;$i<=$#matrix;$i++) {
  my $i=0;
  my $min=$matrix[$i][$#matrix];
  my $j=$#matrix;
  my $one_path_min=matrix_min_sum($min,$i,$j,0);
  print "$one_path_min\n";
  #if ($one_path_min<$all_path_min) { $all_path_min=$one_path_min; }
#}
#print "\n$all_path_min\n";
print "\ndeep recursion=$deep_recursion\n";
