require 'spec_helper'

describe Factors::AgeGenderFactor do
  it 'should find score for age and gender' do
    Factors::AgeGenderFactor.new(:age => 'Over 85', :gender => 'Male').score.should == 100
  end
end