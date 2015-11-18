module ItemContainer
# zakładam że mój sklep nie chce dostarczać towary 
# kwota których jest mniejsza od kwoty minimalnej np. 100
# min ceny zależy od kursu $ który biorę z internetu
	module ClassMethods
		def min_price
			100 
			# connect to the internet and receive currency price
		end
	end

	module InstanceMethods
		# zawiera instansne metody które możemy wykonać 
		# na obiektach klasy Cart i Order
		def add_item(item)
			unless item.price < self.class.min_price
				@items.push item
			end 
		end

		def remove_item
			@items.pop
		end

		def validate
			@items.each {|i| puts "Item has no price" if i.price.nil? }
		end

		def delete_invalid_items
			@items.delete_if { |i| i.price.nil?} 
		end

		def count_valid_items
			@items.count { |i| i.price } 
		end
	end

	# callback : 
	# zaczyna się od self i należy do modułu w którym wykorzystuję
	# include przyjmuje jeden argument
	# base - będzie z siebie przedstawiał tą klasę w którą wkładam moduł
	# by dodać w naszą klasę metody klasssa jest potrzebny extend
	# extend ma argument i on musi być modułem zawierającym wszystkie metody klassa
	def self.included(base)
		base.extend ClassMethods
		# włożenie instansnych metod
		# class_eval blok
		base.class_eval do 
			include InstanceMethods
		end
	end

end