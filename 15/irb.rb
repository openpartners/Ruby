.object_id unikalne id do objekta w języku Ruby 

# operacja na stringach
irb(main):002:0> "ruby".object_id
=> 70191780821700
irb(main):003:0> "ruby".object_id
=> 70191780805040

# operacja na symbolach
irb(main):004:0> :ruby.object_id
=> 626588
irb(main):005:0> :ruby.object_id
=> 626588

"nazwa" - string 
:nazwa - symbol
symboli to wygodny sposób trzymania w pamięci 

hash:
{:klucz => "znaczenie"} # tworzenie
# przykład
my_data = {:name => "Jemes", :family_name => "Bond"}

# wyciąganie danych
puts my_data[:name]
puts my_data[:family_name]