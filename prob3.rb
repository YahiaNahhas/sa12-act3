require 'httparty'
require 'json'

api_key = 'U35MEAFDFN667DDXWY'
url = "https://www.eventbriteapi.com/v3/events/search/?token=#{api_key}&expand=venue"
response = HTTParty.get(url)

if response.success?
  events = JSON.parse(response.body)["_embedded"]["events"] rescue []

  if events.empty?
    puts "No upcoming events found in #{location}."
  else
    puts "Upcoming events in #{location}:"
    events.each_with_index do |event, index|
      puts "#{index + 1}: #{event['name']['text']}"
      puts "Date: #{event['start']['local']}"
      puts "URL: #{event['url']}\n\n"
    end
  end
else
  puts "Failed to retrieve events. Error: #{response.body}"
end
