require 'mechanize'
require 'csv'

class Movie < Struct.new(:rating, :year, :title, :director ); end
  
movies = []
agent = Mechanize.new

main_page = agent.get 'http://www.imdb.com'
list_page = main_page.link_with(text: "Top Rated Movies").click
rows = list_page.root.css(".lister-list tr")

rows.take(10).each do |row|
  title = row.at_css(".titleColumn a").text.strip # strip usunie spacje
  rating = row.at_css(".ratingColumn strong").text.strip

  movie_page = list_page.link_with(text: title).click

  director = movie_page.root.at_css(".itemprop span").text.strip
  year = movie_page.root.at_css("#titleYear a").text.strip

  movie = Movie.new(rating, year, title, director)
  movies << movie
end

puts movies.inspect
# Wynik:
# [#<struct Movie rating="9.2", year="1994", title="The Shawshank Redemption", director="Tim Robbins">, #<struct Movie rating="9.2", year="1972", title="The Godfather", director="Marlon Brando">, #<struct Movie rating="9.0", year="1974", title="The Godfather: Part II", director="Al Pacino">, #<struct Movie rating="8.9", year="2008", title="The Dark Knight", director="Christian Bale">, #<struct Movie rating="8.9", year="1957", title="12 Angry Men", director="Martin Balsam">, #<struct Movie rating="8.9", year="1993", title="Schindler's List", director="Liam Neeson">, #<struct Movie rating="8.9", year="1994", title="Pulp Fiction", director="Tim Roth">, #<struct Movie rating="8.9", year="1966", title="The Good, the Bad and the Ugly", director="Eli Wallach">, #<struct Movie rating="8.9", year="2003", title="The Lord of the Rings: The Return of the King", director="Noel Appleby">, #<struct Movie rating="8.8", year="1999", title="Fight Club", director="Edward Norton">]

CSV.open("top10.csv", "w", col_sep: ";") do |csv|
  csv << ["Ocena", "Rok produkcji", "Tytul filmu", "Rezyser"] # naglowki
  movies.each do |movie|
    csv << [movie.rating, movie.year, movie.title, movie.director]
  end
end