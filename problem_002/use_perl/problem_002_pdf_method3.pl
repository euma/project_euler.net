$limit=4000000;
#my $limit=$ARGV[0];
my $sum=0;
my $a=2;
my $b=8;
while ($a<$limit) {
    print $a," - ";
    $sum=$sum+$a;
    my $h=4*$b+$a;
    $a=$b;
    $b=$h;
}
print $sum,"\n";#ok!
