class WelcomeController < ApplicationController
  def index
    @props=Prop.all

    if logged_in?
          @user = User.find(session[:user_id])
        end
  end
end
