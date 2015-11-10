class Item
	
	def initialize(options={})
		@price = options[:price]
		@weight = options[:weight]
		@name = options[:name]		
	end

	attr_reader :price, :weight, :name
	attr_writer :price, :weight

	def info
	#	[price, weight, name] # tu nie podaję : iż w wewnątrz obiektu można wywołać dowolną metodę  wpisując tylko jej nazwę
	# price.to_s + ", " + weight.to_s + ", " + name.to_s 
		yield (price)
		yield (weight)
		yield (name)
	end

end
