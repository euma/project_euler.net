use Tree::RedBlack;

my $t = new Tree::RedBlack;
$t->insert(3, 'cat');
$t->insert(4, 'dog');
my $v = $t->find(4);
my $min = $t->min;
my $max = $t->max;
$t->delete(3);
$t->print;
