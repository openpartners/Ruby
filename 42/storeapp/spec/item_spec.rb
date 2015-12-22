require "rspec"
require_relative "../app/item"
require_relative "../app/virtual_item"

describe Item do 
  # describe przyjmuje nazwe testowanej klaly

  it "calculates price according to a special formula" do # opis testu
    item = Item.new("kettle", price: 200)
    item.price.should == 232  # should - specjalna metoda sprawdza przejdzie test czy nie
  end
  
end