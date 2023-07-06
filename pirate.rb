def weather_coords(coords)
  require "http"
  require "json"

  pirate_weather_url = "https://api.pirateweather.net/forecast/" + ENV["PIRATE_WEATHER_KEY"] + "/" + coords
  raw_response = HTTP.get(pirate_weather_url)
  parsed_response = JSON.parse(raw_response)

  return parsed_response
end

def current_temp(parsed_response)
  fahrenheit = parsed_response["currently"].fetch("temperature")
  celsius = (fahrenheit - 32) * 5 / 9

  return celsius
end

def any_rain(weather_response)
  hourly = weather_response.fetch("hourly").fetch("data")

  rain = false
  1.upto(12) do |hour|
    if hourly.at(hour).fetch("precipProbability") > 0.4
      rain = true
      break
    end
  end

  if rain
    puts "Yup, bring the umbrella"
  else 
    puts "No, you're good"
  end
  
end
