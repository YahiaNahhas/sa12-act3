require 'httparty'

  api_key = "d41af3d084cadf3893ad34c1"
  source_currency = 'USD'
  target_currency = 'LBP'
  amount_to_convert = 100
  url = "https://api.exchangerate-api.com/v4/latest/#{source_currency}?apikey=#{api_key}"
  response = HTTParty.get(url)
    if response.code == 200
      exchange_rate = JSON.parse(response.body)["rates"][target_currency]
      converted_amount = amount_to_convert * exchange_rate
      puts "#{amount_to_convert} #{source_currency} equals #{converted_amount.round(2)} #{target_currency}"
    else
      puts "Error: Unable to fetch exchange rates. Response code: #{response.code}"
    end
