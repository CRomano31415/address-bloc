#takes two arguments
#arg1 = greeting to be used
#arg 2 = names of people to greet

def greeting
	salute = ARGV[0]
	ARGV.each do |i|
		 p"#{salute} #{i}" if i != salute 
	end
end

greeting