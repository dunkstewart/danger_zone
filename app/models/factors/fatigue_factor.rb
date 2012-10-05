module Factors
  class FatigueFactor < ForensicBase
    def score
      risk * scale
    end
    
    def weight
      1
    end
    
    def name
      "Trip time: #{get_trip_length}h"
    end
    
    def why
      'The amount of time you are travelling causes fatigue and has an impact on the risk of a crash.'
    end
    
    def source
      'http://www.fmcsa.dot.gov/about/outreach/education/driverTips/References.htm'
    end
    
  private
    def get_trip_length
      return @seatbelt if @seatbelt
      uri = URI(method_url('get_trip_length'))
      @seatbelt = Net::HTTP.get(uri).to_i
    end
  
    def scale
      100.0 / 25.0
    end
    
    def risk
      case get_hour.to_i
      when 1 then 1
      when 2 then 2
      when 3 then 2
      when 4 then 2
      when 5 then 2
      when 6 then 1.75
      when 7 then 3
      when 8 then 3
      when 9 then 4
      when 10 then 5
      when 11 then 7
      when 12 then 9
      when 13 then 12.2
      when 14 then 15.4
      when 15 then 18.6
      when 16 then 21.8
      else 25
      end
    end
  end
end