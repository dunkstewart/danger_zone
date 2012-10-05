class SessionsController < ApplicationController
  def create
    session[:payload] = params.to_hash
    redirect_to new_choice_path
  end
end