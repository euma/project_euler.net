use strict;
use warnings;

open(my $in,  "<",  "cipher1.txt")  or die "Can't open input.txt: $!";
my @cipher_chars=();
while (<$in>)
{
  chomp;
  #print "Just read in this line: $_";
  my @split_char=split(",",$_);
  foreach (@split_char)
  {
    #print "$_\n";
    push(@cipher_chars,$_);
  }
}
close $in or die "$in: $!";
print join("\n",@cipher_chars);
print "\n";
