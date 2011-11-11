#!/usr/bin/perl

# Usage:
# ($link, $node) = basic_tree_find( \$tree, $target, $cmp )
#
# Search the tree \$tree for $target.  The optional $cmp
# argument specifies an alternative comparison routine
# (called as $cmp->( $item1, $item2 ) to be used instead
# of the default numeric comparison.  It should return a
# value consistent with the <=> or cmp operators.
#
# Return two items:
#
#    1. a reference to the link that points to the node
#       (if it was found) or to the place where it should
#       go (if it was not found)
#
#    2. the node itself (or undef if it doesn't exist)

sub basic_tree_find {
    my ($tree_link, $target, $cmp) = @_;
    my $node;

    # $tree_link is the next pointer to be followed.
    # It will be undef if we reach the bottom of the tree.
    while ( $node = $$tree_link ) {
        local $^W = 0;      # no warnings, we expect undef values

        my $relation = ( defined $cmp
                    ? $cmp->( $target, $node->{val} )
                    : $target <=> $node->{val} );

        # If we found it, return the answer.
        return ($tree_link, $node) if $relation == 0;

        # Nope - prepare to descend further - decide which way we go.
        $tree_link = $relation > 0 ? \$node->{left} : \$node->{right};
    }

    # We fell off the bottom, so the element isn't there, but we
    # tell caller where to create a new element (if desired).
    return ($tree_link, undef);
}

# $node = basic_tree_add( \$tree, $target, $cmp );
#
# If there is not already a node in the tree \$tree that
# has the value $target, create one.  Return the new or
# previously existing node.  The third argument is an
# optional comparison routine and is simply passed on to
# basic_tree_find.

sub basic_tree_add {
    my ($tree_link, $target, $cmp) = @_;
    my $found;

    ($tree_link, $found) = basic_tree_find( $tree_link, $target, $cmp );

    unless ($found) {
        $found = {
            left  => undef,
            right => undef,
            val   => $target
        };
        $$tree_link = $found;
    }

    return $found;
}

# $val = basic_tree_del( \$tree, $target[, $cmp ] );
#
# Find the element of \$tree that has the value $val
# and remove it from the tree.  Return the value, or
# return undef if there was no appropriate element
# on the tree.

sub basic_tree_del {
    my ($tree_link, $target, $cmp) = @_;
    my $found;

    ($tree_link, $found) = basic_tree_find ( $tree_link, $target, $cmp );

    return undef unless $found;

    # tree_link has to be made to point to any children of $found:
    #  if there are no children, make it null
    #  if there is only one child, it can just take the place
    #    of $found
    #  But, if there are two children, they have to be merged somehow
    #    to fit in the one reference.
    #
    if ( ! defined $found->{left} ) {
        $$tree_link = $found->{right};
    } elsif ( ! defined $found->{right} ) {
        $$tree_link = $found->{left};
    } else {
        MERGE_SOMEHOW( $tree_link, $found );
    }

    return $found->{val};
}

# MERGE_SOMEHOW
#
# Make $tree_link point to both $found->{left} and $found->{right}.

# Attach $found->{left} to the leftmost child of $found->{right}
# and then attach $found->{right} to $$tree_link.
sub MERGE_SOMEHOW {
    my ($tree_link, $found) = @_;
    my $left_of_right = $found->{right};
    my $next_left;

    $left_of_right = $next_left
        while $next_left = $left_of_right->{left};

    $left_of_right->{left} = $found->{left};

    $$tree_link = $found->{right};
}

# traverse( $tree, $func )
#
# Traverse $tree in order, calling $func() for each element.
#    in turn

sub traverse {
    my $tree = shift or return;   # skip undef pointers
    my $func = shift;

    traverse( $tree->{left}, $func );
    &$func( $tree );
    traverse( $tree->{right}, $func );
}
