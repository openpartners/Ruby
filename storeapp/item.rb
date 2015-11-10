class Item
	
	def initialize 
	# specjalny metod w każdej klasie wykonuje się zawsze 
	# przy tworzeniu obiektu egzemplara klasy -  Klasa.new
		@price = 5
	end

	def price # getter
		@price
	end
# gdyby nie było metody price
# def price - metoda zwracająca zmienną @price dostęp przez Item.new.price
# 	@price - własciwość - zmienna objektu klasy Item
# end
# wynik: 
# undefined method `price' for #<Item:0x007fbfa832ec30> (NoMethodError)

	def price=(price_value) # setter
		@price = price_value # tu można nadać wartość zmiennej a póżniej ją zwrócić za pomocą getter'a
	end

end

item1 = Item.new
p item1.price

item1.price = 10 # można też tak: item1.price=(10)
p item1.price

item1.price=(20) # lub item1.price = 20
p item1.price

