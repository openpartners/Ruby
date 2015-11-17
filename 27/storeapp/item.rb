class Item

	@@discount = 0.05 # stała zniżka

	def self.discount
		#jeśli bierzący miesiąć to kwiecień to zniżka będzie 30% dla reszty 10%
		if Time.now.month == 4
			return @@discount + 0.1
		else
			return @@discount
		end
		# zmienne @price i @name nie będą dostępne w self.discount tylko @@discount będzie tam dostępna
	end
	
	def initialize(options={})
		@real_price = options[:price]
		@name = options[:name]		
	end

	attr_reader :real_price, :name
	attr_writer :price

	def info
		yield (price)
		yield (name)
	end

	def price # cena ze zniżką + podatek
		(@real_price - @real_price*self.class.discount) + tax if @real_price # if @real_price  nawet jeśli @real_price będzie nil'em
		# tax - prywatną metodę można wywołać tylko w środku objektu w którym ona zdefiniowana
	end

private

	def tax # podatek na produkt w zaleznosci od typu towaru
		type_tax = if self.class == VirtualItem
			1
		else
			2
		end

		cost_tax = if @real_price > 5 # podatek w zalezności ceny towaru
			@real_price*0.2
		else
			@real_price*0.1
		end

		cost_tax + type_tax # suma podatków 
	end

end
