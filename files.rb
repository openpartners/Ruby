directory_name = "."
# Dir.glob("**/*.rb") - Unix
# Dir.glob(File.join(directory_name, "**", "*.*")).each do |file_name| 
# Wynik: lista plików dla każdego systemu
#./37/storeapp/cart.rb
# ...
# ./44/storeapp/item.rb
  file_data =  Dir.glob(File.join(directory_name, "**", "*.*")).inject({}) do |hash, file_name|
# "/37/storeapp/cart.rb".split(".") ale tak nie robimy
  ext = File.extname(file_name)
  hash[ext] ||= 0
  hash[ext] += 1
  hash # inject oczekuje obiektu przenoszonego do następnej iteracji
end
# puts file_data.inspect
# wynik: {".rb"=>215, ".txt"=>6, ".md"=>1}
# zapiszę wynik do pliku
  File.open("raport.txt", "w") do |file|
    file_data.each do |k, v|
      puts "#{k}\t#{v}" # wyświetli 
      file.puts "#{k}\t#{v}" # zapisze do pliku
    end
  end
# Wynik:
# .rb     215
# .txt    7
# .md     1