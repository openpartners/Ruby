require_relative "string"
require_relative "item_container"
require_relative "item"
require_relative "real_item"
require_relative "virtual_item"
require_relative "antique_item"
require_relative "cart"
require_relative "order"

@items = []
@items << VirtualItem.new({:price => 2000, :weight => 100, :name => "car"})
@items << AntiqueItem.new({:price => 1000, :weight => 200, :name => "kettle"})
@items << RealItem.new({:price => 800, :weight => 100, :name => "dishwasher"})

