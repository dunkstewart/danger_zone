class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_session
  
  def check_session
    puts "***************#{session[:session].andand.inspect}"
    redirect_to root_path unless session[:session] || request.path == '/' || request.path == '/session'
  end
end
