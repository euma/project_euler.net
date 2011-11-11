use Tree::Binary
my $tree = Tree::Binary->new( 'root' );
my $left = Tree::Binary->new( 'left' );
$tree->left( $left );
my $right = Tree::Binary->new( 'left' );
$tree->right( $right );
my $right_child = $tree->right;
$tree->right( undef ); # Unset the right child.
my @nodes = $tree->traverse( $tree->POST_ORDER );
my $traversal = $tree->traverse( $tree->IN_ORDER );
  while ( my $node = $traversal->() ) {
    # Do something with $node here
    print $node;
}
