module Factors
  class DrunkFactor < Base
    def score
      drunk == 'Yes' ? 100 : 0
    end
    
    def weight
      drunk == 'Yes' ? 10 : 1
    end
    
    def name
      "Drunk: #{drunk}"
    end
    
    def why
      'One in three people will be involved in an alcohol-related crash in their lifetime.'
    end
    
    def source
      'http://www-fars.nhtsa.dot.gov/States/StatesAlcohol.aspx'
    end
  end
end