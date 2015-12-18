require_relative "store_application"

StoreApplication.config do |app|
	app.name = "My Store"
	app.environment = :production

	app.admin do |admin|
		admin.email = "andrzejsew@gmail.com"
		admin.login = "admin"
		admin.send_info_emails_on :mondays
	end
end

#puts StoreApplication.name # "My Store"
#StoreApplication.name = "My name"
#puts StoreApplication.name # "My name"
# po dodaniu w store_aplication.rb @instance.freeze
# Wynik: can't modify frozen #<Class:StoreApplication> (RuntimeError)

unless StoreApplication.frozen?
	StoreApplication.name = "My name"
end
#StoreApplication::Admin.email = "new@gmail.com"
#puts StoreApplication::Admin.email # wynik new@gmail.com
puts StoreApplication::Admin.email # wynik andrzejsew@gmail.com


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
# loading files ....
# Class
# :production
# "My Store"
# "admin"
# "andrzejsew@gmail.com"
# car:2302.0:100
# car:2302.0:150
# car:2302.0:200