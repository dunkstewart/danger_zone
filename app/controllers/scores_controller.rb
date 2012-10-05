class ScoresController < ApplicationController
  def show
    @engine = DangerEngine.new
    @engine.factors << Factors::AgeGenderFactor.new(session[:payload])
    @engine.factors << Factors::DrunkFactor.new(session[:payload])
    
    if request.referrer.include? 'forensic/new'
      @engine.factors << Factors::SeatbeltFactor.new(session[:payload])
    end
  end
end