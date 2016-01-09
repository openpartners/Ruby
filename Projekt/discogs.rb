require 'json'
require 'faraday'
require 'awesome_print'
# gem install faraday
# gem install awesome_print

conn = Faraday.new(:url => 'https://api.discogs.com') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

## GET ##

response = conn.get '/releases/249504'     # GET http://sushi.com/nigiri/sake.json
body = response.body

# puts body
# puts body.class # String

json = JSON.parse(body)
# puts json.inspect
# puts json.class # Hash

# awesome_print - zamiast puts
ap json