names = ["Bond", "Jemes", "John"]
names.push "Andrey" # dodaje na końcu tablicy nowy element
p names
names.pop #kasuje ostatni elent z tablicy
p names
names.shift #kasuje pierwszy element z tablicy
p names
# Wynik:
# ["Bond", "Jemes", "John", "Andrey"]
# ["Bond", "Jemes", "John"]
# ["Jemes", "John"]

puts names[0]

# p names
# puts names[0]
# puts names[1]
# puts names[2]
# puts names.class

# Wynik:
# ["Bond", "Jemes", "John"]
# Bond
# Jemes
# John
# Array

my_array = [1, "two", 3, "four"]
# [1, "two", 3, "four"]

my_array + [5, 6, 7]
# [1, "two", 3, "four", 5, 6, 7]

my_array << 8
# [1, "two", 3, "four", 8]

my_array
# [1, "two", 3, "four", 8]
