require 'json'
require 'faraday'
require 'awesome_print'

conn = Faraday.new(:url => 'https://api.discogs.com') do |faraday|
  faraday.request  :url_encoded
  faraday.adapter  Faraday.default_adapter
  faraday.authorization :Discogs, "key=MSUqEyvvnCIvAHXdFQDe, secret=nhBUjvXJeLDJMMFVuaVPaCROlTtVMYzD"
end

response = conn.get '/database/search', {q: "2pac all eyez on me"} do |request|
    request.headers['Content-Type'] = "application/json"
    # tu chce by był zwracany wyłacznie json
end
body = response.body

json = JSON.parse(body)
ap json
puts json.class