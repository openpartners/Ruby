def hallo_name(first_name, family_name)
	puts "My name is " + first_name + " " + family_name
end
hallo_name("James", "Bond")

puts "-------------------"
# in `hallo_family_name': wrong number of arguments (1 for 2) (ArgumentError)


def hallo_family_name(first_name="domyślny_Jemes", family_name="domyślny_Bond")
	unless family_name == "" && first_name == ""
		puts "My name is " + first_name + " " + family_name
	end
end

hallo_family_name
puts "-------------------"
hallo_family_name("James")
puts "-------------------"
hallo_family_name("James", "Bond")
# wynik:
# My name is James Bond
# -------------------
# My name is  domyślny_Jemes domyślny_Bond
# -------------------
# My name is James domyślny_Bond
# -------------------
# My name is James Bond
