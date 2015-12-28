class Order

	attr_reader :items, :placed_at, :time_spent_on_sending_email
	
	include ItemContainer

	def initialize
		@items = Array.new
	end

	def place
		
		@placed_at = Time.now #Unix Time: sekund od 01.01.1970
	
		thr = Thread.new do
			puts "wysyłam e-mail :-) "
			sleep(9)
		end
		while(thr.alive?)
				puts "."
				sleep(1)
		end
		
		sent_email_at = Time.now
		@time_spent_on_sending_email = sent_email_at - @placed_at
	end
end