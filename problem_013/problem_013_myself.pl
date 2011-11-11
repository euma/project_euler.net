#!/usr/bin/perl
use strict;
use warnings; 
use bignum;

my $file_name=$ARGV[0];

#my $lines=0;
#my $words=0;
#my $chars=0;
my $sum=0;

open(FILE, $file_name) || die "Couldn\'t open file $file_name";
foreach my $line (<FILE>) {

  #$chars+=length($line);
  #$line=~/\n$/ and ++$lines;
  #print $line,"\n";
  $sum += $line;

  #$line=~s/^[ \t]*//g;
  #$line=~s/[ \t\r\n]*$//g;
  #my @w=split(/[ \t]+/, $line);
  #$words+=@w;
}
#print "line is: $lines\n";
#print "word is: $words\n";
#print "char is: $chars\n";
print $sum,"\n";
$sum =~ s/^(\d{10})\d+$/$1/;
print $sum,"\n";

close(FILE); 
