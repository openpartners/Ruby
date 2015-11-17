class Cart

	attr_reader :items

	include ItemContainer

	class ItemNotSupported < StandardError; end

	def initialize(owner)
		@items = Array.new
		@owner = owner
	end

	def save_to_file
		File.open("#{@owner}_cart.txt", "w") do |f| 
			@items.each do |i|
				raise ItemNotSupported if i.class == VirtualItem
				f.puts i
			end 
		end
	end

	def read_from_file
		File.readlines("#{@owner}_cart.txt").each { |i| @items << i.to_real_item }
		@items.uniq!
	rescue Errno::ENOENT#, ZeroDivisionError
		File.open("#{@owner}_cart.txt", "w") {}
		puts "file #{@owner}_cart.txt created"
		# end # dajemy ale nie koniecznie blok begin
	end

end