open(my $in,  "<",  "keylog.txt")  or die "Can't open input.txt: $!";
while (<$in>) {     # assigns each line in turn to $_
  #print "Just read in this line: $_";
  chomp;
  my @split_in=split("",$_);
  for (my $i=0;$i<$#split_in;$i++) {
    print "$split_in[$i] ";
  }
  print "\n";
}
close $in or die "$in: $!";
