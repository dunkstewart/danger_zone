class ScoresController < ApplicationController
  def show
    @engine = DangerEngine.new
    @engine.factors << Factors::AgeGenderFactor.new(session[:payload])
    @engine.factors << Factors::DrunkFactor.new(session[:payload])
    @engine.factors << Factors::StateFactor.new(session[:payload]) if session[:payload]['start_address_state'].present?
    
    if request.referrer.include? 'forensic/new'
      @engine.factors << Factors::SeatbeltFactor.new(session[:payload])
      @engine.factors << Factors::WiperFactor.new(session[:payload])
      @engine.factors << Factors::LightsInDayFactor.new(session[:payload])
      @engine.factors << Factors::AbsFactor.new(session[:payload])
      @engine.factors << Factors::SpeedFactor.new(session[:payload])
      @engine.factors << Factors::WeekHourFactor.new(session[:payload])
      @engine.factors << Factors::FatigueFactor.new(session[:payload])
    end
  end
end