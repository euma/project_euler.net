#my $gridSize = 20;
my $gridSize = $ARGV[0];
sub progress {
  my ($x,$y)=@_;
  my $i = 0;
  if ($x < $gridSize) {
    $i += progress($x + 1, $y);
  }
  if ($y < $gridSize) {
    $i += progress($x, $y + 1);
  }
  if ($x == $gridSize && $y == $gridSize) {
    return 1;
  }
  return $i;
}
print progress(0, 0),"\n";
