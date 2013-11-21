# quick script to generate some squares into a file then processed to become a seed for the cards app.

@output_file = "math_out"

def remove(file)
  if File.exists?(file) 
   `rm #{@output_file}`
  end
end

remove(@output_file)
remove("seeds.rb")

@file = File.new("#{@output_file}","a")
@power_symbol = ["\u00B9","\u00B2","\u00B3","\u2074","\u2075","\u2076","\u2077","\u2078","\u2079"]

def squares
  squares = Array (10..30)

  squares.each do |number|
	  @file.puts "#{number}²\t#{number*number}"
	  @file.puts "#{number*number}\t#{number}²"
  end
end

def cubes
  cubes = Array (2..10)
  
  cubes.each do |number|
    @file.puts "#{number}³\t#{number ** 3}"
    @file.puts "#{number ** 3}\t#{number}³"
  end
end  

def power(number, range)
  
  for i in 1..range
    power = i + 1
    @file.puts "#{number}#{@power_symbol[i].encode('utf-8')}\t#{number ** power}"
    @file.puts "#{number ** power}\t#{number}#{@power_symbol[i].encode('utf-8')}"
  end
end

#squares

#cubes

power(2,8)
power(3,5)
power(4,4)
power(5,3)
power(6,2)
