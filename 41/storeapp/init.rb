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

order = Order.new
order.place
puts order.placed_at # 2015-12-18 17:35:47 +0000 #+0000 to strefa czasowa
puts order.placed_at.to_i # 1450460289
puts order.placed_at.utc # 2015-12-18 17:40:04 UTC
puts order.time_spent_on_sending_email # 9.001246758
#http://ruby-doc.org/core-1.9.3/Time.html#method-i-strftime
puts order.placed_at.strftime("%b %-d, %Y %H:%M:%S") # Dec 18, 2015 18:18:59