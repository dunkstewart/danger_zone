module Factors
  class DrunkFactor < Base
    def score
      drunk == 'Yes' ? 100 : 0
    end
    
    def weight
      4
    end
    
    def name
      "Drunk: #{drunk}"
    end
    
    def why
      'It helps you keep in your seat'
    end
    
    def source
      ''
    end
  end
end