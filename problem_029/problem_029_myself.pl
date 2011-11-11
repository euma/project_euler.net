use strict;
use warnings;

sub uniq_arr {
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
my @arr=();
my $max=100;
#$max=5;
for (my $a=2;$a<=$max;$a++) {
  for (my $b=2;$b<=$max;$b++) {
    push(@arr,$a**$b);
  }
}
#print join(" -- ",@arr),"\n";
my @arr2=uniq_arr(@arr);
#print join(" -- ",@arr2),"\n";
print "\n",$#arr2+1,"\n";
