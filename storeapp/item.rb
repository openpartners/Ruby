class Item
	
	def initialize(options)
		@price = options[:price]
		@weight = options[:weight]
	end

	attr_reader :price, :weight
	attr_writer :price, :weight

end

# gdyby był przekazany pusty hash:
# item1 = Item.new({})
# wynik 
# nil
# nil

# gdyby był przekazany dodatkowy klucz:
# item1 = Item.new({ :weight => 10, :price => 20, :price => 25})
# wynik 
# warning: duplicated key at line 18 ignored: :price
# 25
# 10


item1 = Item.new({ :weight => 10, :price => 20})
p item1.price
p item1.weight
# wynik:
# 20
# 10