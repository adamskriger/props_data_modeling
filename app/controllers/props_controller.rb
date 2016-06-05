class PropsController < ApplicationController
  attr_accessor :user, :answer, :choice, :prop_id, :prop, :answer_id, :id
  # before_action :require_login, only: [:show]

  def index
    @props=Prop.all
    if logged_in?
    @user = User.find(session[:user_id])
    end
  end

  def show
    @prop = Prop.find(params[:id])
    if logged_in? && current_user.admin
      @user = User.find(session[:user_id])
    end
  end

  def new
    @prop = Prop.new
    @user = User.find(session[:user_id])

  end

  def edit
    @prop = Prop.find(params[:id])
    @user = User.find(1)
  end

  def create
    @prop = Prop.new(prop_params)
    @user = User.find(session[:user_id])

    @answer = Answer.new

    if @prop.save
      redirect_to @prop
    else
      render 'new'
    end

  end

  def update
        @prop = Prop.find(params[:id])
        # @user = User.find(1) #hardcoded to be admin
        @prop.update(prop_params)

        Answer.all.each  do |answer|
          argument = answer.user_id
          @user = User.find(argument)
          if (answer.prop_id == @prop.id && answer.choice == @prop.choice && @user.id = answer.user_id)
            @user.score  += 5
            @user.save
          else
            @user.score  -= 5
            @user.save
          end
        end
        redirect_to users_path
    end

  def destroy
    @prop = Prop.find(params[:id])
    @prop.destroy

    redirect_to props_path
  end

  def select
    @prop = Prop.find(params[:choice])
  end

  # def require_login
  #   if !logged_in?
  #     flash[:danger]="You must login perform that action"
  #     render 'users/pleaselogin'
  #   end
  # end

end

private
  def prop_params
    params.require(:prop).permit(:title, :text, :choice, :user_id, :id)
  end
