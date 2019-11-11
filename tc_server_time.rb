require_relative "server_time"
require "test/unit"
require 'date'

class TestMGL7460_Ruby < Test::Unit::TestCase

def test_server_time

	d = DateTime.now
	h = d.strftime("%H:%M:%S")
	#assert_equal(4, MGL7460_Ruby.new(2).add(2) )
    assert_equal("#{h} up 1736 days, 16.05 , #{h} idle 2 days, 16.05", MGL7460_Ruby.new.main,"The uptime and idle time of the server are true")
end

end