class WelcomeController < ApplicationController
  def index
    if logged_in?
          @user = User.find(session[:user_id])
        end
  end
end
