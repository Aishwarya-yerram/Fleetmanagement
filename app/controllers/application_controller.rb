class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  def require_login
  	return if @current_user
  	flash[:danger] = "please login first"
  	redirect_to root_path 
  end

  def set_current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def admin
    @admin = Admin.first
  end
end

