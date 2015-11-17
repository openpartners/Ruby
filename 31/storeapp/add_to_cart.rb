require_relative "init"

cart = Cart.new(ARGV.delete_at(0))
ARGV.each do |a|
  @items.each {|i| cart.add_item(i) if a == i.name }
end
cart.read_from_file
begin
	cart.save_to_file
rescue Cart::ItemNotSupported
	puts "one of your items is VirtualItems and not support"
end

# $ ruby add_to_cart.rb andrey car dishwasher kettle
# Wynik
# file andrey_cart.txt created
# one of your items is VirtualItems and not support
