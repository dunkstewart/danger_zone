class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_session
  
  def check_session
    puts "***************#{session[:payload].andand.inspect}"
    redirect_to root_path unless session[:payload] || request.path == '/' || request.path == '/session'
  end
end
