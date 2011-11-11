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
#print join("\n",@cipher_chars);
#print "\n";

for (my $i=ord('a');$i<=ord('z');$i++)
{
  for (my $j=ord('a');$j<=ord('z');$j++)
  {
    for (my $k=ord('a');$k<=ord('z');$k++)
    {
      #print "$i $j $k\n";
      my @encryption_key=();
      my $key_length=$#cipher_chars+1;
      for (my $h=0;$h<int($key_length/3);$h++)
      {
	push(@encryption_key,$i);
	push(@encryption_key,$j);
	push(@encryption_key,$k);
      }
      if ($key_length % 3 == 1)
      {
        push(@encryption_key,$i);
      }
      elsif ($key_length % 3 == 2)
      {
        push(@encryption_key,$i);
	push(@encryption_key,$j);
      }
      my $plain_text="";
      for (my $h=0;$h<$key_length;$h++)
      {
	my $num=$cipher_chars[$h] ^ $encryption_key[$h];
	if ($num >=127) { goto BOTTOM; }
	my $char=chr($num);
	#print "$char($num)";
	$plain_text=$plain_text.$char;
      }
      print $plain_text;
      print "\n==========================\n";
      BOTTOM:
    }
  }
}
