my $max=100;
sub is_triangle
{
  my $x=shift;
  my $num=sqrt(1+8*$x)/2-1/2;
  if ($num == int($num))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}
print "\n------triangle number--------\n";
for (my $i=1;$i<=$max;$i++) {
  if (is_triangle($i))
  {
    print "$i ";
  }
}
print "\n--------------\n";
for (my $i=1;$i<=sqrt(2*$max);$i++) {
  print $i*($i+1)/2;
  print " ";
}
print "\n--------------\n";

sub is_square
{
  my $x=shift;
  my $num=sqrt($x);
  if ($num == int($num))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}
print "\n------square number--------\n";
for (my $i=1;$i<=$max;$i++) {
  if (is_square($i))
  {
    print "$i ";
  }
}
print "\n--------------\n";
for (my $i=1;$i<=sqrt(2*$max);$i++) {
  print $i*$i;
  print " ";
}
print "\n--------------\n";

sub is_pentagonal
{
  my $x=shift;
  my $num=sqrt(24*$x+1)/6+1/6;
  if ($num == int($num))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}
print "\n------pentagonal number--------\n";
for (my $i=1;$i<=$max;$i++) {
  if (is_pentagonal($i))
  {
    print "$i ";
  }
}
print "\n--------------\n";
for (my $i=1;$i<=sqrt(2*$max);$i++) {
  print $i*(3*$i-1)/2;
  print " ";
}
print "\n--------------\n";

sub is_hexagonal
{
  my $x=shift;
  my $num=sqrt(8*$x+1)/4+1/4;
  if ($num == int($num))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}
print "\n------hexagonal number--------\n";
for (my $i=1;$i<=$max;$i++) {
  if (is_hexagonal($i))
  {
    print "$i ";
  }
}
print "\n--------------\n";
for (my $i=1;$i<=sqrt(2*$max);$i++) {
  print $i*(2*$i-1);
  print " ";
}
print "\n--------------\n";

sub is_heptagonal
{
  my $x=shift;
  my $num=sqrt(40*$x/9+1)*3/10+3/10;
  if ($num == int($num))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}
print "\n------heptagonal number--------\n";
for (my $i=1;$i<=$max;$i++) {
  if (is_heptagonal($i))
  {
    print "$i ";
  }
}
print "\n--------------\n";
for (my $i=1;$i<=sqrt(2*$max);$i++) {
  print $i*(5*$i-3)/2;
  print " ";
}
print "\n--------------\n";

sub is_octagonal
{
  my $x=shift;
  my $num=sqrt(3*$x+1)/3+1/3;
  if ($num == int($num))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}
print "\n------octagonal number--------\n";
for (my $i=1;$i<=$max;$i++) {
  if (is_octagonal($i))
  {
    print "$i ";
  }
}
print "\n--------------\n";
for (my $i=1;$i<=sqrt(2*$max);$i++) {
  print $i*(3*$i-2);
  print " ";
}
print "\n--------------\n";
