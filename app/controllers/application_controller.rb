class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create, :destroy]

  def current_user
    # session[:user_id]
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  def logged_in?
    !current_user = nil
  end

  helper_method :current_user


end
