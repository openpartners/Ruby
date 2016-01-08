require 'sinatra'
require 'sinatra/reloader'

get '/' do 
  erb :index
end


# gem install sqlite3 sequel
# Wynik: "ruby procent.rb -p $PORT -o $IP" na c9.com

