require_relative "item_container"
require_relative "cart"
require_relative "order"
require_relative "item"
require_relative "real_item"
require_relative "virtual_item"

@items = []
@items << VirtualItem.new({:price => 101, :weight => 100, :name => "car"})
@items << RealItem.new({:price => 101, :weight => 200, :name => "kettle"})
@items << RealItem.new({:price => 99, :weight => 100, :name => "dishwasher"})

