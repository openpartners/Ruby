a = if ARGV[0]
	ARGV[0].to_i
else
	1
end 
# bardziej elegancki sposób niż :
# a = ARGV[0]
# if ARGV[0]
# 	a = ARGV[0].to_i # konwertuję stringa w liczbę
# else
# 	a = 1
# end

# a = 1

while a < 10
	#puts "'a' variable is " + a    
	#in `+': no implicit conversion of Fixnum into String (TypeError)
	puts "'a' variable is " + a.to_s
	# a = a + 1 # nie ładny zapis
	a += 1 # ładny zapis
	sleep 1 #zamraża program na 1 sekundę
end