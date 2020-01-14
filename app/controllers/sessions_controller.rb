class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: session_params[:name])

    if user && user.authenticate(session_params[:password])
      flash[:info] = 'You are logged in'
      session[:user_id] = user.id
      redirect_to root_url
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
end
