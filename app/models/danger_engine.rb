class DangerEngine
  attr_accessor :factors
  
  def initialize
    self.factors = []
  end
  
  def score
    return @score if @score
    total_score = factors.reduce(0) { |memo, factor| memo + factor.weighted_score }
    total_weight = factors.reduce(0) { |memo, factor| memo + factor.weight }
    total_score / total_weight
  end
  
  def rating
    case score
    when 0..20 then 'Tom'
    when 21..40 then 'Val'
    when 41..60 then 'Jester'
    when 61..80 then 'Kelly'
    else 'Goose'
    end
  end
  
  def rating_image
    rating.underscore + '.jpg'
  end
end