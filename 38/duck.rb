class Duck

	def initialize(greeting)
		@greeting = greeting
	end

	def quack 
		puts @greeting
	end

	class << self
		attr_accessor :greeting
		def icv
			puts @greeting
			puts "Class quack"
		end
	end

end

duck1 = Duck.new("quack quack")
duck1.quack

Duck.greeting = "icv"
Duck.icv

# Wynik:
# quack quack
# icv
# Class quack