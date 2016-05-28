class SessionsController < ApplicationController

  def new
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end




end

private
  def params
    params.require(:session).permit(:email,:password)
  end
