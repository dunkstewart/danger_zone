module Factors
  class Base < OpenStruct
    def weighted_score
      score * weight
    end
    
    def <=>(other)
      weighted_score <=> other.weighted_score
    end
  end
end