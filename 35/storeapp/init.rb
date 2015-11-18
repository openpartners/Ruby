require_relative "string"
require_relative "item_container"
require_relative "item"
require_relative "real_item"
require_relative "virtual_item"
require_relative "antique_item"
require_relative "cart"
require_relative "order"

@items = []
# od ruby 1.9
@items << AntiqueItem.new("car", price: 2000, weight: 100)
@items << RealItem.new("kettle", price: 1000, weight: 200)
@items << RealItem.new("dishwasher", price: 800, weight: 100)

cart = Cart.new("Andrey")
cart.add_item RealItem.new("car", price: 2000, weight: 100)
cart.add_item RealItem.new("car", price: 2000, weight: 150)
cart.add_item RealItem.new("car", price: 2000, weight: 200)

method = "all_cars"
puts cart.send(method)
# Wynik:
# car:2302.0:100
# car:2302.0:150
# car:2302.0:200
