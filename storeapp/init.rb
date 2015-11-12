require_relative "cart"
require_relative "item"
require_relative "real_item"
require_relative "virtual_item"


item1 = VirtualItem.new({:price => 10, :weight => 100, :name => "Car"})
item2 = RealItem.new({:weight => 200, :name => "Table"})

cart = Cart.new
cart.add_item item1
cart.add_item item2


puts item1.price