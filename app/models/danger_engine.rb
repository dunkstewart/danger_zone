class DangerEngine
  attr_accessor :factors
  
  def initialize
    self.factors = []
  end
  
  def score
    return @score if @score
    total_score = factors.reduce(0) { |memo, factor| memo + factor.weighted_score }
    total_weight = factors.reduce(0) { |memo, factor| memo + factor.weight }
    (total_score / total_weight).to_i
  end
  
  def rating
    case score
    when 0..20 then 'Maverick'
    when 21..40 then 'Iceman'
    when 41..60 then 'Jester'
    when 61..80 then 'Kelly'
    else 'Goose'
    end
  end
  
  def rating_image
    rating.underscore + '.jpg'
  end
  
  def rating_quote
    case score
    when 0..20 then "On March 3, 1969 the United States navy established an elite school for the top one percent of it's pilots.  The pilots call it topgun pilot!"
    when 21..40 then 'Is this your idea of fun man?'
    when 41..60 then 'Top topgun rules of engagement are written for you safety.  They are not flexible. Nor am I. Either obey them or you are history. Is that clear?'
    when 61..80 then 'The defence department regrets to inform you that your sons are dead because they were stupid!'
    else "That was some of the best driving i've seen to date. Right up until the part you got killed!"
    end
  end
end