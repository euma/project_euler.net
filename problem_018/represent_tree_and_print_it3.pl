my $tree1 = [1];
print $tree1,"\n";
print $tree1->[0],"\n";
print $$tree1[0],"\n";
my $tree2 = [1,[2],
               [3]];
print $tree2,"\n";
print $tree2->[0],"\n";
print $$tree2[0],"\n";

print $tree2->[0]->[0],"\n";
print $tree2->[0]->[1],"\n";

print $tree2->[0][0],"\n";
print $tree2->[0][1],"\n";
