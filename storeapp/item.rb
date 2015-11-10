class Item
	
	def initialize 
	# specjalny metod w każdej klasie wykonuje się zawsze 
	# przy tworzeniu obiektu egzemplara klasy -  Klasa.new
		@price = 1
	end

	# metody klasy
	
	# getter
	attr_reader :price, :weight # co oznacza :jakaś_nazwa ---> symbol
	
	# setter
	attr_writer :price, :weight
	# bez weight 
	# wynik: undefined method `weight=' for #<Item:0x007f671924a4c8 @price=10> (NoMethodError)

	# getter i setter
	# attr_accessor :price, :weight



end

item1 = Item.new
p item1.price

item1.price = 5
p item1.price

item1.weight = 10
p item1.weight