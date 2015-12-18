class RealItem < Item

	attr_reader :weight

	def initialize(name, options)
		@weight = options[:weight]
		super
	end

	def info
		yield(weight)
		super
	end

end
