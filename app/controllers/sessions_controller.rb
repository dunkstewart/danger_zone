class SessionsController < ApplicationController
  def create
    session[:payload] = params
    redirect_to new_choice_path
  end
end