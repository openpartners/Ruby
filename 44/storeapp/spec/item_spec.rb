require "rspec"
require_relative "../app/item"
require_relative "../app/virtual_item"

describe Item do 

  before(:each) do
    #ładuje się za każdym razem jak się wchodzi do it
   @item = Item.new("kettle", price: 200)
  end
  
  before(:all) do
    # z tym ostrożniej iż
    # ładuje się tylko raz
    # @item = Item.new("kettle", price: 200)
    # jeśli w pierwszym tescie modyfikuje obiekt to w drugim jest zmienioina cena 
    # drugi test nie przejdzie
    # Wynik:
    # .F
    # Failures:
    
    #   1) Item return ifo about an object
    #     Failure/Error: @item.to_s.should == "kettle:232.0"
    
    #       expected: "kettle:232.0"
    #             got: "kettle:347.0" (using ==)
    #     # ./spec/item_spec.rb:21:in `block (2 levels) in <top (required)>'
  end
  
  after(:each) {} # żadko ale można np. by posprzątać  po wykonaniu testu
  after(:all) {}
  
  it "calculates price according to a special formula" do # opis testu
    @item.price.should == 232  # should - specjalna metoda sprawdza przejdzie test czy nie
    @item.price = 300
  end
  
  it "return ifo about an object" do
    @item.to_s.should == "kettle:232.0"
  end
  
end