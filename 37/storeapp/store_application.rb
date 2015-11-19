class StoreApplication
	class << self # wewnątrz tego bloku mamy wszystkie metody metodami klassa
		def new # nadpiszemy metodę new
			unless @instance # by nie było kilka # loading files ....
				puts "loading files ...."
				puts self.class # Class
				require_relative "string"
				require_relative "item_container"
				require_relative "item"
				require_relative "real_item"
				require_relative "virtual_item"
				require_relative "antique_item"
				require_relative "cart"
				require_relative "order"
			end
				@instance ||= self # na sam klass StoreApplication
		end
	end
end