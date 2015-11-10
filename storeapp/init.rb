require_relative "cart"
require_relative "item"

cart = Cart.new

cart.add_item(Item.new)
cart.add_item(Item.new)
p cart.items

# wynik
# [#<Item:0x007f8d918586a0 @price=nil, @weight=nil>, #<Item:0x007f8d91858650 @price=nil, @weight=nil>]

cart.remove_item
p cart.items

# wynik
# [#<Item:0x007ffafb038380 @price=nil, @weight=nil>, #<Item:0x007ffafb038330 @price=nil, @weight=nil>]
# [#<Item:0x007ffafb038380 @price=nil, @weight=nil>]
