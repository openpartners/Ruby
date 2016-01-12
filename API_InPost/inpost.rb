require 'json'
require 'faraday'
require 'awesome_print'

conn = Faraday.new(:url => 'https://api-pl.easypack24.net') do |faraday|
  faraday.request  :url_encoded
  faraday.adapter  Faraday.default_adapter
end

response = conn.get '/v4/machines?type=0'
body = response.body
results = JSON.parse(body)

embedded = results["_embedded"]
machines = embedded["machines"]

# Array ["_links", "id", "type", "services", "payment_type", "address", "status", "address_str", "location", "location_description", "location_description2", "operating_hours"]
ap machines.find { |id| id["id"] == "KRA011" }

# Hash {"street", "building_no", "post_code", "city", "province"}
machines.each do |machine|
  address = machine["address"]
  ap machine["address_str"] if address["city"] == "Kraków"
end

# Array [0, 1]
gps = machines.find { |g| g["location"].include?(20.44475)}
ap gps["location"]
