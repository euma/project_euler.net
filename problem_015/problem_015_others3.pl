#require "memoize.rb"

sub find_routes {
  my ($x, $y) = @_;
  my $routes = 0;
  if ($y > 0) {
    $routes += find_routes($x, $y - 1);
  }
  if ($x > 0) {
    $routes += find_routes($x - 1, $y);
  }
  if ($x == 0 && $y == 0) {
    return 1;
  }
  return $routes;
}
#memoize :find_routes
#t = Time.now
#p find_routes(20, 20)
#t = Time.now - t
#p "elapsed time: %.2f" % t 
#print find_routes(20,20),"\n";

my $n=$ARGV[0];
print find_routes($n,$n),"\n";
