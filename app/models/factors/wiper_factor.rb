require 'net/http'

module Factors
  class WiperFactor < ForensicBase
    def score
      wiper_on ? 100 : 0
    end
    
    def weight
      2
    end
    
    def name
      "Wipers #{wiper_on ? 'on' : 'off'}"
    end
    
    def why
      '46% of weather-related crash fatalities due to rain'
    end
    
    def source
      'http://www.ops.fhwa.dot.gov/weather/q1_roadimpact.htm'
    end
    
    def wiper_on
      return @seatbelt if @seatbelt
      uri = URI(method_url('get_windshield_wiper_on'))
      json = JSON.parse(Net::HTTP.get(uri))
      @seatbelt = json['value']
    end
  end
end