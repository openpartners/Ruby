require_relative "init"

cart = Cart.new
# ARGV zawiera wszystkie akgumenty przekazane w command line
ARGV.each do |a|
  @items.each {|i| cart.add_item(i) if a == i.name }
end
p cart.items


# $ ruby add_to_cart.rb car kettle dishwasher
# wynik
# [
# 	#<VirtualItem:0x007f0f2d11cb80 @real_price=101, @name="car">, 
# 	#<RealItem:0x007f0f2d11cb08 @weight=200, @real_price=101, @name="kettle">, 
# 	#<RealItem:0x007f0f2d11ca90 @weight=100, @real_price=99, @name="dishwasher">
# ]
