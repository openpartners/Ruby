class RealItem < Item

	attr_reader :weight

	def initialize(options)
		@weight = options[:weight]
		super #by domyślne również były wywołane initialize z klassa Item z tymi samymi argumentami options co w RealItem
	end

	def info
		yield(weight)
		super #by domyślne również były wywołane info z klassa Item z tymi samymi argumentami options co w RealItem
	end

end
