require 'net/http'

module Factors
  class LightsInDayFactor < ForensicBase
    def score
      lights_in_day ? 0 : 100
    end
    
    def weight
      1
    end
    
    def name
      "Lights #{lights_on ? 'on' : 'off'} in the daytime"
    end
    
    def why
      'The analysis found that DRLs have no statistically significant overall effects on the three target crashes.'
    end
    
    def source
      'http://www.regulations.gov/#!documentDetail;D=NHTSA-2008-0153-0004'
    end
    
    def lights_on
      return @seatbelt if @seatbelt
      uri = URI(method_url('get_lights_on_during_day'))
      json = JSON.parse(Net::HTTP.get(uri))
      @seatbelt = json['value']
    end
  end
end