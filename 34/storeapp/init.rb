require_relative "string"
require_relative "item_container"
require_relative "item"
require_relative "real_item"
require_relative "virtual_item"
require_relative "antique_item"
require_relative "cart"
require_relative "order"

@items = []
@items << VirtualItem.new({:price => 2000, :weight => 100, :name => "car"})
@items << AntiqueItem.new({:price => 1000, :weight => 200, :name => "kettle"})
@items << RealItem.new({:price => 800, :weight => 100, :name => "dishwasher"})

cart = Cart.new("Andrey")
cart.all_car
#cart.some_car
cart.add_item RealItem.new({:price => 2000, :weight => 50, :name => "car"})
cart.add_item RealItem.new({:price => 2000, :weight => 100, :name => "kettle"})
cart.add_item RealItem.new({:price => 2000, :weight => 150, :name => "dishwasher"})

# p cart.all_cars
# [#<RealItem:0x007fd9b72b01b8 @weight=50, @real_price=2000, @name="car">]

puts cart.all_cars # car:2302.0:50
puts cart.all_kettle # kettle:2302.0:100


# $ ruby init.rb 
# wynik:
# showing all items
# /home/openpartners/Projekty/Ruby/33/storeapp/item_container.rb:26:in `method_missing': undefined method `some_car' for #<Cart:0x007ff709fe60c0 @items=[], @owner="Andrey"> (NoMethodError)
# 	from init.rb:17:in `<main>'

# $ ruby init.rb 
# car:2302.0:50