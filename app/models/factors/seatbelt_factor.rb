require 'net/http'

module Factors
  class SeatbeltFactor < Base
    def score
      seatbelt_on ? 0 : 100
    end
    
    def weight
      4
    end
    
    def name
      "Seatbelt: #{seatbelt_on}"
    end
    
    def why
      'One in three people will be involved in an alcohol-related crash in their lifetime.'
    end
    
    def source
      'http://www-fars.nhtsa.dot.gov/States/StatesAlcohol.aspx'
    end
    
    def seatbelt_on
      return @seatbelt if @seatbelt
      uri = URI('http://www.busbender.com/dangerzone/tools/trip_data.php?car=Michael/FordFiesta4&function=get_seatbelt_on_during_trip')
      json = JSON.parse(Net::HTTP.get(uri))
      @seatbelt = json['value']
    end
  end
end