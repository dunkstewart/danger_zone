module Factors
  class SpeedFactor < ForensicBase
    def score
      risk * scale
    end
    
    def weight
      10
    end
    
    def name
      "Speed: #{get_speed.to_i}mph"
    end
    
    def why
      'Speeding is one of the most prevalent factors contributing to traffic crashes. The economic cost to society of speeding-related crashes is estimated by NHTSA to be $40.4 billion per year. In 2009, speeding was a contributing factor in 31 percent of all fatal crashes, and 10,591 lives were lost in speeding-related crashes. Speedingrelated fatalities decreased by 10 percent from 11,767 in 2008 to 10,591 in 2009.'
    end
    
    def source
      'http://www-nrd.nhtsa.dot.gov/Pubs/811397.pdf'
    end
    
  private
    def get_speed
      return @seatbelt if @seatbelt
      uri = URI(method_url('get_top_speed'))
      json = JSON.parse(Net::HTTP.get(uri))
      @seatbelt = json.first['Value']
    end
  
    def scale
      100.0 / 2701.0
    end
    
    def risk
      
      case get_speed.to_i
      when 0..35 then 1277
      when 35..40 then 1279
      when 40..45 then 724
      when 45..50 then 1508
      when 50..55 then 465
      else 2701
      end
    end
  end
end