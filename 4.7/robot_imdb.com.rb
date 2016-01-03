require "mechanize"

agent = Mechanize.new

main_page = agent.get 'http://www.imdb.com'
list_page = main_page.link_with(text: "Top Rated Movies").click
rows = list_page.root.css(".lister-list tr")
# puts rows.size
# wynik
# 250
rows.take(10).each do |row|
title = row.at_css(".titleColumn a").text.strip # strip usunie spacje
# puts title
# Wynik:
# The Shawshank Redemption
# The Godfather
# The Godfather: Part II
# The Dark Knight
# 12 Angry Men
# Schindler's List
# Pulp Fiction
# The Good, the Bad and the Ugly
# The Lord of the Rings: The Return of the King
# Fight Club
rating = row.at_css(".ratingColumn strong").text.strip
# puts "#{title}: #{rating}"
# Wynik:
# The Shawshank Redemption: 9.2
# The Godfather: 9.2
# The Godfather: Part II: 9.0
# The Dark Knight: 8.9
# 12 Angry Men: 8.9
# Schindler's List: 8.9
# Pulp Fiction: 8.9
# The Good, the Bad and the Ugly: 8.9
# The Lord of the Rings: The Return of the King: 8.9
# Fight Club: 8.8
movie_page = list_page.link_with(text: title).click
director = movie_page.root.at_css(".itemprop span").text.strip
year = movie_page.root.at_css("#titleYear a").text.strip
puts "Rating: #{rating}, year: #{year}\t Title: #{title}:\t Director: #{director}" 
# Wynik:
# Rating: 9.2, year: 1994  Title: The Shawshank Redemption:        Director: Tim Robbins
# Rating: 9.2, year: 1972  Title: The Godfather:   Director: Marlon Brando
# Rating: 9.0, year: 1974  Title: The Godfather: Part II:  Director: Al Pacino
# Rating: 8.9, year: 2008  Title: The Dark Knight:         Director: Christian Bale
# Rating: 8.9, year: 1957  Title: 12 Angry Men:    Director: Martin Balsam
# Rating: 8.9, year: 1993  Title: Schindler's List:        Director: Liam Neeson
# Rating: 8.9, year: 1994  Title: Pulp Fiction:    Director: Tim Roth
# Rating: 8.9, year: 1966  Title: The Good, the Bad and the Ugly:  Director: Eli Wallach
# Rating: 8.9, year: 2003  Title: The Lord of the Rings: The Return of the King:   Director: Noel Appleby
# Rating: 8.8, year: 1999  Title: Fight Club:      Director: Edward Norton
end