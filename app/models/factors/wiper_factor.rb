require 'net/http'

module Factors
  class WiperFactor < Base
    def score
      wiper_on ? 100 : 0
    end
    
    def weight
      2
    end
    
    def name
      "Wiper: #{wiper_on}"
    end
    
    def why
      '46% of weather-related crash fatalities due to rain'
    end
    
    def source
      'http://www.ops.fhwa.dot.gov/weather/q1_roadimpact.htm'
    end
    
    def wiper_on
      return @seatbelt if @seatbelt
      uri = URI('http://www.busbender.com/dangerzone/tools/trip_data.php?car=Michael/FordFiesta4&function=get_windshield_wiper_on')
      json = JSON.parse(Net::HTTP.get(uri))
      @seatbelt = json['value']
    end
  end
end