class SessionsController < ApplicationController
  def create
    session[:session] = params
    redirect_to new_choice_path
  end
end