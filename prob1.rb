require 'httparty'
require 'json'
api_key = "cbb51bba4401d977f0151a5ea9fd414d"
city_name = "Southaven"
url = "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{api_key}"
response = HTTParty.get(url)

if response.code == 200
    weather_data = JSON.parse(response.body)
    temp_kelvin = weather_data["main"]["temp"]
    temp_fahrenheit = (temp_kelvin - 273.15) * 9/5 + 32
    humidity = weather_data["main"]["humidity"]
    conditions = weather_data["weather"].first["description"]

    puts "Current weather in #{city_name}:"
    puts "Temperature: #{temp_fahrenheit.round(2)}°F"  # Display temperature in Fahrenheit
    puts "Humidity: #{humidity}%" #current humiditiy
    puts "Conditions: #{conditions}" # Expected conditions
else
  puts "Cannot retrieve weather data.The Response code is: #{response.code}"
end
