class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:negative] = 'You must be logged in to perform that action'
      redirect_to root_path
    end
  end
end
