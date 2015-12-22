class StoreApplication
	class << self # wewnątrz tego bloku mamy wszystkie metody metodami klassa
		def config 
			unless @instance
				yield(self)
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
				@instance.freeze
		end
		attr_accessor :name, :environment
		def admin(&block)
			@admin ||= Admin.new(&block) # w ten sposób przekazujemy blok do new klassy Admin
		end
	end
		class Admin
			class << self
				def new
					unless @instance
						yield(self) # self jest klassą Admin
					end
					@instance ||= self
					@instance.freeze
				end
				attr_accessor :email, :login
				def send_info_emails_on(day)
					@send_info_emails_on = day
				end
			end
		end
end

