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
		return unless File.exists?("#{@owner}_cart.txt")
		File.readlines("#{@owner}_cart.txt").each { |i| @items << i.to_real_item }
		@items.uniq!
	end

end