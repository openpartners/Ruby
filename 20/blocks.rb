10.times { puts "Hello world" }

james_bond = {:first_name => "Jemes", :middle_name => "Andrey", :last_name => "Bond"} 
#{} tworzą obiekt klasy Hash

james_bond.each_key { |key| puts james_bond[key] }
#{} oznaczają blok
# {:first_name=>"Jemes", :middle_name=>"Andrey", :last_name=>"Bond"}
# {:first_name=>"Jemes", :middle_name=>"Andrey", :last_name=>"Bond"}
# {:first_name=>"Jemes", :middle_name=>"Andrey", :last_name=>"Bond"}


james_bond.each_key { |key| puts james_bond[key] }
#{} oznaczają blok
# Jemes
# Andrey
# Bond

File.open("./blocks.txt", "w") { |f| f.puts "Hello world"}
# otwieramy zapisujemy i zamknie się sam iż jest jest block 
