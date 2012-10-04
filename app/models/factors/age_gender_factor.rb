module Factors
  class AgeGenderFactor < Base
    GENDERS = ['Male', 'Female']
    
    def score
      risk * scale
    end
    
    def weight
      5
    end
    
  private
    def scale
      100 / 31.2
    end
    
    def risk
      gender_index = AgeGenderFactor::GENDERS.index(gender)
      gender_risk = case age
      when 0..13 then [2.1, 1.6]
      when 13..15 then [4.2, 3.2]
      when 16..19 then [19.3, 10.3]
      when 20..24 then [27.5, 10.3]
      when 25..29 then [21.8, 7.5]
      when 30..34 then [18.2, 6.2]
      when 35..39 then [16.1, 6.1]
      when 40..44 then [16.0, 6.0]
      when 45..49 then [16.9, 6.1]
      when 50..54 then [16.6, 5.9]
      when 55..59 then [16.9, 6.2]
      when 60..64 then [15.8, 5.7]
      when 65..69 then [14.8, 7.3]
      when 70..74 then [15.1, 7.8]
      when 75..79 then [20.3, 10.7]
      when 80..84 then [23.1, 13.2]
      when 85..150 then [31.2, 12.8]
      end
      gender_risk[gender_index]
    end
  end
end