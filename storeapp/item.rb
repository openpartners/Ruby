class Item
	def price
		rand(100) #losyje liczby od 0 do 100
	end
end

item1 = Item.new.price
item2 = Item.new.price
p item1
p item2

# item1 = Item.new
# item2 = Item.new
# item3 = Item.new

# p item1
# p item2
# p item3
# wynik 
# <Item:0x007feb388aab30>
# <Item:0x007feb388aab08>
# <Item:0x007feb388aaae0>

