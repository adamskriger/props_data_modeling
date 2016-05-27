class AnswersController < ApplicationController
  attr_accessor :user, :answer

  def index

  end

  def new
    @answer = Answer.find(params[:prop_id])
    @prop = Prop.find(params[:prop_id])

  end

  def create
    @user = User.find(session[:user_id])
    @answer = @user.answers.create(params[:choice])

    if @answer.save

    redirect_to root_path

    else
    render 'new'
    end


  end


  def show
    @answer = Answer.find params[:id]

  end
end
