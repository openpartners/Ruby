class Cart

	attr_reader :items

	include ItemContainer

	def initialize(owner)
		@items = Array.new
		@owner = owner
	end

	def save_to_file
		File.open("#{@owner}_cart.txt", "w") do |f| 
			@items.each { |i| f.puts i} 
			# metoda puts oczekuje jako argument string
			# jeśli nie jest string to automatycznie próbuje konwertować za pomocą to_s
			# jeśli obiekt odpowiada na to_s to z koszyka wejsdzie to_s
			# car:100:50
		end
	end

	def read_from_file
		# return unless File.exists?("#{@owner}_cart.txt")
		# 	cart.rb:24:in `readlines': No such file or directory @ rb_sysopen - andrey_cart.txt (Errno::ENOENT)
		# from /home/openpartners/Projekty/Ruby/30/storeapp/cart.rb:24:in `read_from_file'
		# from add_to_cart.rb:10:in `<main>'
		
		# begin # dajemy ale nie koniecznie
		# 10/0 #ZeroDivisionError
		File.readlines("#{@owner}_cart.txt").each { |i| @items << i.to_real_item }
		@items.uniq!
	rescue Errno::ENOENT#, ZeroDivisionError
		File.open("#{@owner}_cart.txt", "w") {}
		puts "file #{@owner}_cart.txt created"
		# end # dajemy ale nie koniecznie blok begin
	end

end