require 'sinatra'
require 'sinatra/reloader'

get '/hi' do
   # "Hello World! #{params.inspect} #{params.class}"
   now = Time.now
   erb :index, locals: { date: now}
end

get '/hello' do 
    erb :hello
end


# Wynik: "ruby procent.rb -p $PORT -o $IP" na c9.com
# problem z odświeżaniem treści bez ponownego uruchomiania serwera - sinatra/reloader:
# gem install sinatra-contrib
