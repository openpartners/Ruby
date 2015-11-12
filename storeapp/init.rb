require_relative "cart"
require_relative "item"
require_relative "real_item"
require_relative "virtual_item"


item1 = VirtualItem.new({:price => 10, :weight => 100, :name => "Car"})
item2 = RealItem.new({:weight => 200, :name => "Table"})

cart = Cart.new
cart.add_item item1
cart.add_item item2

p cart.items

cart.delete_invalid_items

p cart.items

# Wynik
# [#<Item:0x007effca241280 @price=10, @weight=100, @name="Car">, #<Item:0x007effca241050 @price=nil, @weight=200, @name="Table">]
# [#<Item:0x007effca241280 @price=10, @weight=100, @name="Car">]

p item1.respond_to?(:weight)
p item2.respond_to?(:weight)
