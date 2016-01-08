require 'sinatra'
require 'sinatra/reloader'

get '/' do 
  erb :index
end

post '/calculate' do
  
  years = params["years"].to_i
  amount = params["amount"].to_f
  percent = params["percent"].to_f/100.0
  
  new_amount = amount*((1 + percent/365.0)**(years*365))
  
  erb :calculate, locals: { new_amount: new_amount}
end

# Wynik: "ruby procent.rb -p $PORT -o $IP" na c9.com

