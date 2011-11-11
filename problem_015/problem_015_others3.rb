#require "memoize.rb"
require "/home/vhv/.rvm/gems/ruby-1.9.2-p290/gems/i18n-0.5.0/lib/i18n/backend/memoize.rb"

def find_routes(x, y)
routes = 0
if y > 0
routes+=find_routes(x, y - 1)
end
if x > 0
routes+=find_routes(x - 1, y)
end
if x == 0 && y == 0
routes+=1
end
routes
end
memoize :find_routes #? not work!


t = Time.now
p find_routes(20, 20)
t = Time.now - t
p "elapsed time: %.2f" % t 
