# C F v i
argv = ARGV
n = argv[0].to_i

def fibonacci_i(n) 
	if n <= 2
		return 1
	else
		f1 = 1
		f2 = 1
		for i in 3..n 
			sum = f1 + f2 
			f1 = f2 
			f2 = sum 
		end
		return sum
	end
end
p fibonacci_i(n)