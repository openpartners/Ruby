# rows = File.open("raport.txt", "r") {|f| f.readlines }
# puts rows.inspect
# Wynik:
# [".rb\t215\n", ".txt\t7\n", ".md\t1\n", ".doc\t18\n", ".yml\t33\n", ".jpg\t89\n", ".conf\t10\n", ".erb\t99\n", ".haml\t80\n", ".scss\t2\n", ".json\t32\n", ".gif\t4\n", ".png\t45"]

# usuwam \n
# rows = File.open("raport.txt", "r") {|f| f.readlines }.map {|e| 
#     e.chomp
# }
# puts rows.inspect
# Wynik:
# [".rb\t215", ".txt\t7", ".md\t1", ".doc\t18", ".yml\t33", ".jpg\t89", ".conf\t10", ".erb\t99", ".haml\t80", ".scss\t2", ".json\t32", ".gif\t4", ".png\t45"]

# dzielę za pomocą split 
# powstaną 2 stringi 
# 1 element - string to rozszerzenie, 2 element to string ilość wystąpień
# rows = File.open("raport.txt", "r") {|f| f.readlines }.map {|e| 
#     e.chomp.split("\t")
# }
# puts rows.inspect
# Wynik
# tablica tablic
# [[".rb", "215"], [".txt", "7"], [".md", "1"], [".doc", "18"], [".yml", "33"], [".jpg", "89"], [".conf", "10"], [".erb", "99"], [".haml", "80"], [".scss", "2"], [".json", "32"], [".gif", "4"], [".png", "45"]]

# jest ich za dużo 
# chce wybrać tylko 5 najczęściej występujących rozszerzeń 
# rows = File.open("raport.txt", "r") {|f| f.readlines }.map {|e| 
#     e.chomp.split("\t")
# }.sort_by{|e| e.last.to_i}.reverse.take(5)
# puts rows.inspect
# Wynik:
# [[".rb", "215"], [".erb", "99"], [".jpg", "89"], [".haml", "80"], [".png", "45"]]

# tworzę diagram
# rows = File.open("raport.txt", "r") {|f| f.readlines }.map {|e| 
#     e.chomp.split("\t")
# }.sort_by{|e| e.last.to_i}.reverse.take(5)
# puts rows.inspect
# values = rows.map { |r| r.last }.join(",")
# labels = rows.map { |r| r.first }.join("|")
# # chds -- nie obcina wartości
# url = "https://chart.googleapis.com/chart?cht=p&chds=a&chs=600x350&chl=#{labels}&chd=t:#{values}"
# puts url
# Wynik:
# https://chart.googleapis.com/chart?cht=p&chds=a&chs=600x350&chl=.rb|.erb|.jpg|.haml|.png&chd=t:215,99,89,80,45

# irb: ---> ./irb.rb
# Sztuczka z open-uri

# pobieranie z internetu obrazku - diagramu
require 'open-uri'

rows = File.open("raport.txt", "r") {|f| f.readlines }.map {|e| 
    e.chomp.split("\t")
}.sort_by{|e| e.last.to_i}.reverse.take(5)
puts rows.inspect
values = rows.map { |r| r.last }.join(",")
labels = rows.map { |r| r.first }.join("|")
# chds -- nie obcina wartości
url = "https://chart.googleapis.com/chart?cht=p&chds=a&chs=600x350&chl=#{labels}&chd=t:#{values}"
image_content = open(url).read
File.open("raport.png", "w") { |f| f.write(image_content)}
# Wynik
# Plik na dysku raport.png z wygenerowanym diagramem za pomocą Google Chart API 
# Na obrazku Top 5 rozszerzeń wyciągniętych z pliku raport.txt