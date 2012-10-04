require 'spec_helper'

describe DangerEngine do
  class StrongFactor < Factors::Base
    def score; 67 end
    def weight; 3 end
  end
  
  class WeakFactor < Factors::Base
    def score; 100 end
    def weight; 1 end 
  end
  
  it 'should calculate a danger score' do
    engine = DangerEngine.new
    engine.factors << StrongFactor.new
    engine.factors << WeakFactor.new
    engine.score.should == 75
  end
  
  it 'should return factors in order of influence' do
    engine = DangerEngine.new
    engine.factors << (weak = WeakFactor.new)
    engine.factors << (strong = StrongFactor.new)
    engine.factors.sort.should == [strong, weak]
  end
  
  it 'should determine rating' do
    engine = DangerEngine.new
    engine.factors << StrongFactor.new
    engine.factors << WeakFactor.new
    engine.rating.should == 'Kelly'
    engine.rating_image.should == 'kelly.jpg'
  end
end