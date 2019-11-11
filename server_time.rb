require 'date'
class MGL7460_Ruby

#puts d.strftime("%Y/%m/%d %H:%M")
#=> "2019/11/01 20:09"
#puts d.next_month.strftime("%Y/%m/%d %H:%M")
#=> "2019/12/01 20:09"
#puts "Please enter your name."
#name = gets.chop
#puts "Hello, #{name}! I'm Ruby!"


def main
@d = DateTime.now
@h = @d.strftime("%H:%M:%S")
readFile
end

def readFile

@file_contents = File.read('uptime_file.txt')
numbers = @file_contents.scan(/\d+\.\d+/)

#numbers = file_contents.scan(/(\d+\.\d+)/)
#numbers.collect! &:to_f #=> convert string numbers to decimal
numbers.collect! &:to_i #=> convert string numbers to integer

@numFirst = numbers.first
@numLast = numbers.last

calculateDays(@numFirst,@numLast)
end

=begin
def initialize(num)
  raise unless num.is_a?(Numeric)
  @x = num
end


def add(y)
  @x + y
end
=end
  
def calculateDays(num1,num2)

	@f = num1/86400
	@remain_active = num1-(@f * 86400)

	@s = num2/86400
	@remain_inactive = num2-(@s * 86400)

	@hour_remained_active = @remain_active/3600.0
	@hour_remained_inactive = @remain_inactive/3600.0

	#puts @hour_remained_active
	#puts @hour_remained_inactive

	if ((0 < @hour_remained_active && @hour_remained_active < 1) || 
		(24 < @hour_remained_active && @hour_remained_active < 25) || 
		(48 < @hour_remained_active && @hour_remained_active < 49)
	   )
		x = "5 Min"
	elsif ((1 < @hour_remained_active && @hour_remained_active < 24) ||
			(25 < @hour_remained_active && @hour_remained_active < 48) ||
			(49 < @hour_remained_active)
		   )
		x = "16.05"
	end
	

	if ((0 < @hour_remained_inactive && @hour_remained_inactive < 1) || 
		(24 < @hour_remained_inactive && @hour_remained_inactive < 25) || 
		(48 < @hour_remained_inactive && @hour_remained_inactive < 49)
	   )
		y = "5 Min"
	elsif ((1 < @hour_remained_inactive && @hour_remained_inactive < 24) ||
			(25 < @hour_remained_inactive && @hour_remained_inactive < 48) ||
			(49 < @hour_remained_inactive)
		   )
		y = "16.05"
	end	
		

	if (@f <1)
		@r1 = "#{@h} up #{x}"
		puts @r1
	else
		@r1 = "#{@h} up #{@f} days, #{x}" 
		puts @r1
	end

	if (@s <1)
		@r2 = "#{@h} idle #{y}"
		puts @r2
	else
		@r2 = "#{@h} idle #{@s} days, #{y}" 
		puts @r2
	end

	results(@r1,@r2)
	#case hour_remained_active
	#when 0..1
	#	puts "#{h} up 5 Min"
	#when 1..24
	#	puts "#{h} up 16.05"
	#when 24..48
	#	(24 < hour_remained_active && hour_remained_active < 25) ? puts "#{h} up 1 days, 5 Min" : puts "#{h} up 1 days, 16.05"

	#else
	#  puts "The time is not in the range"
	#end

end

def results(result1,result2)
	result1 + " , " + result2	
end

end
myProgram = MGL7460_Ruby.new()
myProgram.main
#myProgram.calculateDays(150055117.05,177000.00)
