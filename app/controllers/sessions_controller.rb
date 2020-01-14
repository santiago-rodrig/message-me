class SessionsController < ApplicationController
  before_action :already_logged?, only: [:new, :create]
  before_action :require_user, only: :destroy

  def new; end

  def create
    user = User.find_by(name: session_params[:name])

    if user && user.authenticate(session_params[:password])
      flash[:info] = 'You are logged in'
      session[:user_id] = user.id
      redirect_to chatroom_url
    else
      flash.now[:negative] = 'Wrong credentials'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:info] = 'Session terminated'
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end

  def already_logged?
    if logged_in?
      flash[:warning] = 'You are already logged in'
      redirect_to chatroom_url
    end
  end
end
