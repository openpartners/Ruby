class Item
	
	def initialize(options)
		@price = options[:price]
		@weight = options[:weight]
	end

	attr_reader :price, :weight
	attr_writer :price, :weight

end

puts Item.new({ :price => 30}).price

# wynik:
# 30