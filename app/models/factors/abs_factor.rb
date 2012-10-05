require 'net/http'

module Factors
  class AbsFactor < ForensicBase
    def score
      abs_triggered ? 100 : 0
    end
    
    def weight
      2
    end
    
    def name
      "ABS Triggered: #{abs_triggered}"
    end
    
    def why
      'ABS is designed to help the driver maintain control of the vehicle during emergency braking situations, not make the car stop more quickly. ABS may shorten stopping distances on wet or slippery roads and many systems will shorten stopping distances on dry roads. On very soft surfaces, such as loose gravel or unpacked snow, an ABS system may actually lengthen stopping distances. In wet or slippery conditions, you should still make sure you drive carefully, always keep a safe distance behind the vehicle in front of you, and maintain a speed consistent with the road conditions.'
    end
    
    def source
      'http://www.nhtsa.gov/cars/problems/equipment/absbrakes.html'
    end
    
    def abs_triggered
      return @seatbelt if @seatbelt
      uri = URI(method_url('get_abs_tripped'))
      json = JSON.parse(Net::HTTP.get(uri))
      @seatbelt = json['value']
    end
  end
end