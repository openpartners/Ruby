def digit
	r = /\d+/
	txt = "to jest 1 tekst w którym jest dużo liczb takich jak 3423 i nawet 18.5 i też 234"
	p "w tekście: " + txt
	digits = txt.scan(r)
	puts "znaleziono: #{digits}"
	result = 0
	digits.each{|y|
		result += y.to_f
	}
	return result
end
p "Summa: " + digit.to_s
