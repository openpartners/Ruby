require "rspec"
require_relative "../app/item"
require_relative "../app/virtual_item"
require_relative "../app/antique_item"
require_relative "../app/item_container"
require_relative "../app/cart"

describe Cart do
  
  it "adds items ito the cart" do
    cart = Cart.new("Andrey")
    item1 = Item.new("ketter", price: 200)
    item2 = Item.new("car", price: 1000)
    cart.add_items(item1, item2)
    cart.items.should include(item1, item2)
  end
  
end