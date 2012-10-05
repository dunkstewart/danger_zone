module Factors
  class AgeGenderFactor < Base
    GENDERS = ['Male', 'Female']
    AGE_RISK = {
      'Under 13' => [2.1, 1.6],
      '13 to 15' => [4.2, 3.2],
      '16 to 19' => [19.3, 10.3],
      '20 to 24' => [27.5, 10.3],
      '25 to 29' => [21.8, 7.5],
      '30 to 34' => [18.2, 6.2],
      '35 to 39' => [16.1, 6.1],
      '40 to 44' => [16.0, 6.0],
      '45 to 49' => [16.9, 6.1],
      '50 to 54' => [16.6, 5.9],
      '55 to 59' => [16.9, 6.2],
      '60 to 64' => [15.8, 5.7],
      '65 to 69' => [14.8, 7.3],
      '70 to 74' => [15.1, 7.8],
      '75 to 79' => [20.3, 10.7],
      '80 to 84' => [23.1, 13.2],
      'Over 85' => [31.2, 12.8]
    }
    
    def score
      risk * scale
    end
    
    def weight
      4
    end
    
    def name
      "#{gender} #{age}"
    end
    
    def why
      'At all ages, males had higher per capita crash death rates than females in 2010. Males ages 20-24 and 85 and older had the highest rates of crash deaths.'
    end
    
    def source
      'http://www.iihs.org/research/fatality.aspx?topicName=OverviewofFatalityFacts#Ageandgender'
    end
    
  private
    def scale
      100 / 31.2
    end
    
    def risk
      gender_index = AgeGenderFactor::GENDERS.index(gender)
      AgeGenderFactor::AGE_RISK[age][gender_index]
    end
  end
end