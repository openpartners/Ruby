class Duck

	def initialize(greeting)
		@greeting = greeting
	end

	def quack 
		puts @greeting
	end

	def self.quack
		puts @greeting
		puts "Class quack"
	end

end

duck1 = Duck.new("quack quack")
duck1.quack
Duck.quack

# Wynik:
# quack quack
# ---- niccccc
# Class quack




