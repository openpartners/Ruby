require_relative "store_application"

puts StoreApplication.new == StoreApplication.new
p StoreApplication.new
# StoreApplication.new

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

# Singleton - specjalna klassa u której można stworzyć tylko jeden egzemplarz
# Wynik:
# loading files .... # by się nie powtarzały loading files .... loading files ....
# Class # by się nie powtarzały Class .... Class ....
# true
# StoreApplication
# car:2302.0:100
# car:2302.0:150
# car:2302.0:200



