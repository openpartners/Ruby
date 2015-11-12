class Item

	@@discount = 0.1 # stała zniżka

	def self.discount
		#jeśli bierzący miesiąć to kwiecień to zniżka będzie 30% dla reszty 10%
		if Time.now.month == 4
			return @@discount + 0.2
		else
			return @@discount
		end
		# zmienne @price i @name nie będą dostępne w self.discount tylko @@discount będzie tam dostępna
	end
	
	def initialize(options={})
		@price = options[:price]
		@name = options[:name]		
	end

	attr_reader :price, :name
	attr_writer :price

	def info
		yield (price)
		yield (name)
	end

	def price
		# @price - @price * Item.discount # NIE --- bo jeśli w przyszłości 
		# w dziedziczonych klasach stworzę własny self.discount 
		# to one się nie wywołają a wywołają się z rodzica
		@price - @price * self.class.discount # wywoła sie w każdym klasie 

	end

end
