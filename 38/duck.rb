class Duck

@@hello ="Hello"

	def initialize(greeting)
		@greeting = greeting
	end

	def quack 
		puts "#{@@hello} #{@greeting}"
	end

	class << self
		attr_accessor :icv
		def icv
			puts "#{@@hello} #{@icv}"
		end
	end

end

duck1 = Duck.new("quack")
duck1.quack

Duck.icv = "icv"
Duck.icv

# Wynik:
# Hello quack
# Hello icv
