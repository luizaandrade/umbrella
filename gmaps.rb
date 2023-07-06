def get_coords(location)

  require "http" 
  require "json"

  location = location.gsub(" ", "%20")
  maps_url = "https://maps.googleapis.com/maps/api/geocode/json?" + "address=" + location +"&key=" + ENV["GMAPS_KEY"]
  raw_response = HTTP.get(maps_url)
  parsed_response = JSON.parse(raw_response)

  results = parsed_response["results"]
  location = results
    .at(0)
    .fetch("geometry")
    .fetch("location")

  coords = location.fetch("lat").to_s + "," + location.fetch("lng").to_s

  return coords
end
