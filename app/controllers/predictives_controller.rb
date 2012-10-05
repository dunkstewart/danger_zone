class PredictivesController < ApplicationController
  def create
    redirect_to score_path
  end
end