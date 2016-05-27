class PropsController < ApplicationController
  attr_accessor :user, :answer, :choice, :prop

  def index
    @props=Prop.all
  end

  def show
    @prop = Prop.find(params[:id])
  end

  def new
    @prop = Prop.new
  end

  def edit
    @prop = Prop.find(params[:id])
  end

  def create
    @prop = Prop.new(prop_params)

    @answer = Answer.new

    if @prop.save
    redirect_to @prop
    else
    render 'new'
    end

  end

  def update
    @user = User.find(session[:user_id])

    @prop = Prop.find(params[:id])
    @answer = Answer.find(session[:user_id])

    if @prop.update(prop_params)
      redirect_to @prop
    else
      render 'edit'
    end

    if @answer.choice == @prop.choice
      puts "hello"
      @user.score += 7
      @user.save
    else
      @user.score -= 7
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
    params.require(:prop).permit(:title, :text, :choice)
  end
