class Cart

	attr_reader :items

	def initialize
		@items = Array.new
	end

	def add_item(item)
		@items.push item
	end

	def remove_item
		@items.pop
	end

	def validate
		@items.each {|i| puts "Item has no price" if i.price.nil? }
	end

	def delete_invalid_items
		@items.delete_if { |i| i.price.nil?} 
		# zmienna |i| ma raz obiekt klasy RealItem albo VirtualItem 
		# ale sama klasa Cart myśli że ma doczynienie z obiektem klasy Item
		# polimorfizm - obiektom nie ważne z jakimi innymi obiektami mają doczynienia 
		# aby obiekty zachowywały się tak samo
	end

end