sub fact {
  my $i=shift;
  my $value=1;
  while($i!=0) {
    $value=$value*$i;
    $i--;
  }
  return $value;
}
print "Enter the numbe of rows you want in the triangle:";
my $rows=<>;
for(my $i=0;$i<$rows;$i++) {
  print "$i:";
  #Moving each row by rows-i spaces to get a triangular shape
  for(my $k=0;$k<($rows-$i);$k++) {
    #print " ";
    print "*";
  }
  #Loop for printing each row
  for(my $j=0;$j<=$i;$j++) {
    #print " ",fact($i)/(fact($j)*fact($i-$j)); #nCr=n!/(r!*(n-r)!)
    print "#",fact($i)/(fact($j)*fact($i-$j)); #nCr=n!/(r!*(n-r)!)
  }
  print "\n";
}
