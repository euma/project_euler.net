open(my $in,  "<",  "poker.txt")  or die "Can't open input.txt: $!";
my @head_total=();
my %seen_head=();

my @tail_total=();
my %seen_tail=();
while (<$in>) { # assigns each line in turn to $_
  #print "Just read in this line: $_";
  #print "Just read in this line: $_";
  my @split_char=split(" ",$_);
  #print "\n---------------------\n";
  #print join(":",@split_char);
  #print "\n";
  my @head=();
  my @tail=();
  foreach (@split_char) {
    my @split_value=split("",$_);
    #if ($split_value[0] eq "T") {
    #  print "$_\n";
    #}
    #print "$split_value[0]::$split_value[1]\n";
    if (not $seen_head{$split_value[0]} ) {
      push(@head_total,$split_value[0]);
    }
    if (not $seen_tail{$split_value[1]} ) {
      push(@tail_total,$split_value[1]);
    }

    $seen_head{$split_value[0]}=1;
    $seen_tail{$split_value[1]}=1;
    push(@head,$split_value[0]);
    push(@tail,$split_value[1]);
  }
  #print join(":",@head);
  #print "\n";
  #print join(":",@tail);
  #print "\n";
  #print "\n---------------------\n";

}
close $in or die "$in: $!";
print "\n######\n";
print join(":",@head_total);
print "\n######\n";
print join(":",@tail_total);
print "\n######\n";
