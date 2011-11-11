use strict;
use warnings;
use Algorithm::Permute;

sub unique_array {
    my %seen = ();
    my @r = ();
    foreach my $a (@_) {
        unless ($seen{$a}) {
            push @r, $a;
            $seen{$a} = 1;
        }
    }
    return @r;
}
my @array = (1 .. 9);
my @regular=(
  '^(\d)(\d{4})(\d{4})$',
  '^(\d{2})(\d{3})(\d{4})$',
  '^(\d{3})(\d{2})(\d{4})$',
  '^(\d{4})(\d)(\d{4})$'
);

my @arr_get=();
Algorithm::Permute::permute {
  #print join("",@array),"\n";
  my $num=join("",@array);
  #print "$num\n";
  foreach (@regular) {
    $num =~ /$_/;
    #print "$1 $2 $3\n";
    if ($1*$2 == $3) {
      #print "$1 $2 $3\n";
      push(@arr_get,$3);
    }
  }
} @array;
@arr_get=unique_array(@arr_get);
#print join(" -- ",@arr_get);
my $sum=0;
foreach (@arr_get) {
  $sum += $_;
}
print "\n",$sum,"\n";
