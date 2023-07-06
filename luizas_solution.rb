require "./gmaps.rb"
require "./pirate.rb"

line = "========================================"

puts line
puts "    Will you need an umbrella today?    "
puts line
puts ""
puts "Where are you?"

location = gets.chomp

puts ""
puts "Checking the weather at " + location + "..."

coords = get_coords(location)
weather_response = weather_coords(coords)
celsius = current_temp(weather_response)

puts "The current temperature is " + celsius.round.to_s + "°C."

puts ""
puts "Checking rain forecast..."

any_rain(weather_response)
