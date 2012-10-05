class PredictivesController < ApplicationController
  def create
    session[:payload].merge(params)
    redirect_to score_path
  end
end