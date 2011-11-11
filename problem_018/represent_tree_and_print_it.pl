use Data::Dumper;
$tree = [ 't', [ 'a' , [ 'b' , [], 'c' , [] ],
                 'd' , [ 'e' , [], 'f' , [] ] ] ];

print Dumper($tree);
sub elements {
    my $tree = shift;

    my @elements;
    my @queue = @$tree;
    while (@queue) {
        my $element  = shift @queue;
        my $children = shift @queue;
        push @elements, $element;
        unshift @queue, @$children;
    }

    return @elements;
}

@elements = elements($tree);     # qw(t a b c d e f)
print join(" -- ",@elements),"\n";
