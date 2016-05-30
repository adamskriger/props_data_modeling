class PropsController < ApplicationController
  attr_accessor :user, :answer, :choice, :prop_id, :prop, :answer_id, :id

  def index
    @props=Prop.all
  end

  def show
    @prop = Prop.find(params[:id])
  end

  def new
    @prop = Prop.new
    @user = User.find(session[:user_id])

  end

  def edit
    @prop = Prop.find(params[:id])
    @user = User.find(session[:user_id])


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
     @answer = Answer.find(params[:id])
     @user = User.all
     @prop = Prop.find(@answer.prop_id)
     @prop.update(prop_params)

       Answer.all.each
        if (@answer.choice.to_s == @prop.choice.to_s)
          @user.score  += 5
          @user.save
        else
           @user.score -= 5
           @user.save
        end

  end


  def destroy
    @prop = Prop.find(params[:id])
    @prop.destroy

    redirect_to props_path
  end

  def select
    @prop = Prop.find(params[:choice])
  end

end

private
  def prop_params
    params.require(:prop).permit(:title, :text, :choice, :user_id, :id)
  end
