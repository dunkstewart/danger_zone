require 'net/http'

module Factors
  class SeatbeltFactor < ForensicBase
    def score
      seatbelt_on ? 0 : 100
    end
    
    def weight
      4
    end
    
    def name
      "Seatbelt #{seatbelt_on ? 'buckled' : 'unbuckled'}"
    end
    
    def why
      ''
    end
    
    def source
      ''
    end
    
    def seatbelt_on
      return @seatbelt if @seatbelt
      uri = URI(method_url('get_seatbelt_on_during_trip'))
      json = JSON.parse(Net::HTTP.get(uri))
      @seatbelt = json['value']
    end
  end
end