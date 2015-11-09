i = 0
# można
if i > 1
	puts "number is greater than 1"
end

if i < 1
	puts "number is less than 1"
end
# każdy if jest sprawdzony przy dowolnym warunku 

puts "-------------------------------------------"

# elegantniej
if i > 1
	puts "number is greater than 1"
elsif i < 1
	puts "number is less than 1"
end

puts "-------------------------------------------"

# i = 1
i = 1
if i > 1
	puts "number is greater than 1"
elsif i < 1
	puts "number is less than 1"
else
	puts "number is equals 1"
end

# jeśli warunek w elsif spełniony to na resztę do end
# interpretator nie zwróci uwagi

puts "-------------------------------------------"

