use warnings;
use strict;
use Class::Struct;

struct node => { $data = '$';
  struct node* $left;
  struct node* $right;
}
my $node1 = node->new( $data =>
