def hello_word(first_name="domyślnyJames", family_name="domyślnyBond")
	greeting = "hello world \n"
	if family_name != "" && first_name != ""
			greeting += "My name is " + first_name + " " + family_name
	end
	return greeting
end
puts hello_word
puts hello_word("James")
puts hello_word("James","Bond")
