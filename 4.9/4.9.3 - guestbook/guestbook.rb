require 'sinatra'
require 'sinatra/reloader'
require 'sequel'

DB = Sequel.sqlite "database.db"

get '/' do 
  posts = DB[:posts]
  erb :index, locals: { posts: posts.order(Sequel.desc(:create_at)) }
end

post "/massages" do
  posts = DB[:posts]
  posts.insert author: params[:author],
    content: params[:content],
    create_at: Time.now
    
  redirect "/"
end


# gem install sqlite3 sequel
# Wynik: "ruby procent.rb -p $PORT -o $IP" na c9.com

