def hello_word(family_name="domyślnyBond", first_name="domyślnyJames")
	greeting = "hello world \n"
	if family_name != "" && first_name != ""
			greeting += "My name is " + first_name + " " + family_name
	end
	return greeting
end
puts hello_word("Bond", "James")
