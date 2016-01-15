require "rspec"
require_relative "../app/item"
require_relative "../app/virtual_item"
require_relative "../app/item_container"

# Gdy testuję moduł a nie klasę to muszę w teście stworzyć klasę

class ItemBox
  include ItemContainer
  
  def initialize
    @items = []
  end
  
end

describe ItemContainer do
  
  before(:each) do
    @box = ItemBox.new
    @item1 = Item.new("kettle", price: 200)
    @item2 = Item.new("kettle", price: 300)
  end
  # czy napewno Itemsy które trafiają do ItemBox są przechowywane w @items
  it "adds items into the container" do
    @box.add_item(@item1)
    @box.add_item(@item2)
    # have - sprawdza ile obiektów zwracane sa za pomocą metody
    # @box.items.should have(2).items
    expect(@box.items).to have_exactly(2).items
  end
  
  it "remove item from the box" do
    @box.add_item(@item1)
    @box.add_item(@item2)
   # @box.remove_item.should be(@item2)
    expect(@box.remove_item).to be(@item2)
    @box.remove_item
   # @box.items.should be_empty
    expect(@box.items).to be_empty
  end
  
  it "raises error if user is trying to add anything else but an item" do
    #lambda {@box.add_item("something else")}.should raise_error
    expect(lambda {@box.add_item("something else")}).to raise_error
    
  end
  
end