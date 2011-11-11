#!/usr/bin/perl -w
use strict;
use Tree::DAG_Node;

my $tree = [ [ 'Node1' ], [ [ 'GrandChild1' ], [ 'GrandChild2' ], 'Node2' ], 'Root' ]; 

my $dagnode= Tree::DAG_Node->lol_to_tree($tree);
print map {"$_\n"} @{ $dagnode->draw_ascii_tree };
