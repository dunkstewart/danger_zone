module Factors
  class Base < OpenStruct
    def weighted_score
      score * weight
    end
    
    def <=>(other)
      weighted_score <=> other.weighted_score
    end
    
    def risk_desc
      case score
      when 0..25 then 'Low Risk'
      when 26..50 then 'Medium Risk'
      when 51..75 then 'High Risk'
      else 'Extreme Risk'
      end
    end
    
    def importance_desc
      case weight
      when 1 then 'Trivial'
      when 2 then 'Some Importance'
      when 3 then 'Important'
      else 'Very Important'
      end
    end
  end
end