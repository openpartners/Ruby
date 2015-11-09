def hello_word # nazwa małe litery 
	puts "hello world"
end
hello_word # wywołanie metody baz argumentów

puts "-----------------"

# wywołanie metody z argumentami

def hallo_name(name)
	puts "hello " + name
end
hallo_name("Andrey")
hallo_name("Marta")
hallo_name("Basia")

# hello world
# -----------------
# hello Andrey
# hello Marta
# hello Basia
