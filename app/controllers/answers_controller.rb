class AnswersController < ApplicationController
  attr_accessor :user, :answer

  def index

  end

  def new
    @prop = Prop.find(params[:prop_id])

    @user = User.find(session[:user_id])

    @answer = Answer.new

  end

  def create
    @prop = Prop.find(params[:prop_id])
    @user = User.find(session[:user_id])
    @answer = @user.answers.create(answer_params)

    if @answer.save

    redirect_to root_path

    else
    render 'new'
    end

    if @answer.choice == @prop.choice
      puts "hello"
      @user.score = 5
      @user.save
    else
      @user.score = 0
      @user.save

    end


  end


  def show
    @answer = Answer.find params[:id]

  end
end

private
def answer_params
  params.require(:answer).permit(:choice, :id, :prop_id)
end
