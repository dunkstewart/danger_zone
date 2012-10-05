class PredictivesController < ApplicationController
  def create
    session[:session].merge(params)
    redirect_to score_path
  end
end