require_relative "string"
require_relative "item_container"
require_relative "item"
require_relative "real_item"
require_relative "virtual_item"
require_relative "antique_item"
require_relative "cart"
require_relative "order"

@items = []
@items << AntiqueItem.new({:price => 2000, :weight => 100, :name => "car"})
@items << VirtualItem.new({:price => 1000, :weight => 200, :name => "kettle"})
@items << RealItem.new({:price => 800, :weight => 100, :name => "dishwasher"})

cart = Cart.new("Andrey")
cart.all_car
#cart.some_car
cart.add_item RealItem.new({:price => 2000, :weight => 50, :name => "car"})
cart.add_item RealItem.new({:price => 2000, :weight => 100, :name => "kettle"})
cart.add_item RealItem.new({:price => 2000, :weight => 150, :name => "dishwasher"})

puts cart.kind_of?(Cart) # true
puts @items[0].kind_of?(Item) # true  - iż klasa VirtualItem jest dziedziczony po klasie Item
puts @items[0].class == AntiqueItem # true - iż dokładnie sprawdza jaką obiekt ma klassę
puts @items[0].class == Item # false  - iż dokładnie sprawdza jaką obiekt ma klassę

puts @items[0].respond_to?(:info) # true
puts @items[0].respond_to?(:important_info) # false

# równoznaczne zapis, ale send wywoła nawet prywatną metodę
puts @items[0].send(:price) # 2302.0
puts @items[0].price  # 2302.0
#pryvat method tax
puts @items[0].send(:tax) # 402.0
# puts @items[0].tax  # init.rb:35:in `<main>': private method `tax' called for #<AntiqueItem:0x007f64dabb0198 @real_price=2000, @name="car"> (NoMethodError)
method = "all_cars"
p cart.send(method) # [#<RealItem:0x007f9f54ecbb98 @weight=50, @real_price=2000, @name="car">]
puts cart.send(method) # car:2302.0:50