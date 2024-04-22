require 'httparty'
require 'json'

def get_events(api_key)
  url = "https://www.eventbriteapi.com/v3/events/search/?token=#{api_key}&expand=venue&location.within=10km&location.latitude=40.7128&location.longitude=-74.0060"  # Adjust the latitude and longitude according to the desired location
  response = HTTParty.get(url)

  if response.success?
    events = JSON.parse(response.body)["_embedded"]["events"] rescue []
    return events
  else
    puts "Failed to retrieve events. Error: #{response.body}"
    return []
  end
end

api_key = 'U35MEAFDFN667DDXWY'
events = get_events(api_key)

if events.empty?
  puts "No upcoming events found."
else
  puts "Upcoming events:"
  events.each_with_index do |event, index|
    puts "#{index + 1}: #{event['name']['text']}"
    puts "Date: #{event['start']['local']}"
    puts "URL: #{event['url']}\n\n"
  end
end
