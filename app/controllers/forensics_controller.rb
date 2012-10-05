class ForensicsController < ApplicationController
  def create
    session[:payload].merge!(params.to_hash)
    redirect_to score_path
  end
end