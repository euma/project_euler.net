#struct node {
#int data;
#struct node* left;
#struct node* right;
#}
use warnings;
use strict;

use Class::Struct;
struct Breed => { name => '$', cross => '$', };
struct Cat => [ name => '$', kittens => '@', markings => '%', breed => 'Breed', ];
my $cat = Cat->new( name => 'Socks',
		kittens  => ['Monica', 'Kenneth'],
		markings => { socks=>1, blaze=>"white" },
		breed    => Breed->new(name=>'short-hair', cross=>1),
	   or:  breed    => {name=>'short-hair', cross=>1},);
print "Once a cat called ", $cat->name, "\n";
print "(which was a ", $cat->breed->name, ")\n";
print "had two kittens: ", join(' and ', @{$cat->kittens}), "\n";
