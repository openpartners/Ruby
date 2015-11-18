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

		# def method_missing(method_name)
		# 	puts "taki #{method_name} metod nie istnieje"
		# end
		# bez def method_missing(method_name) 
		# wynik
		# init.rb:16:in `<main>': undefined method `all_car' for #<Cart:0x007fd26050a598 @items=[], @owner="Andrey"> (NoMethodError)

		def method_missing(method_name)
			# specjalna metoda która się wykonuje jesli wywołano metodę której nie ma
			if method_name =~ /^all_/
				show_all_items_with_name(method_name.to_s.sub(/^all_/, '').chomp('s'))
				# z początku stringa  kasuję all a z końca  liczbę mnogą s
			else
				super
			end
		end

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

		private

		def show_all_items_with_name(n)
			@items.map { |i|  i if n== i.name}.delete_if { |i| i.nil?}
			# .delete_if { |i| i.nil?} kasuje wszystkie obiekty które są nil
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