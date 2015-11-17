require_relative "init"

# przekażę initialize Cart ownera
# 1 z ARGV pierwszy element znika owner
# 2 delete_at też zwróci ownera
cart = Cart.new(ARGV.delete_at(0))
ARGV.each do |a|
  @items.each {|i| cart.add_item(i) if a == i.name }
end
cart.read_from_file
cart.save_to_file

# ruby add_to_cart.rb andrey car dishwasher kettle
# wynik
# w pliku andrey_cart.txt
# car:2302.0:100
# dishwasher:922.0:100
# kettle:1152.0:200