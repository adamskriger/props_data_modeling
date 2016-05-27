class AnswersController < ApplicationController
  attr_accessor :user, :answer

  def index

  end

  def new
    @user = User.find(session[:user_id])

    @prop = Prop.find(params[:prop_id])
    @answer = Answer.new

  end

  def create

    @user = User.find(session[:user_id])
    @answer = @user.answers.create(answer_params)

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

private
def answer_params
  params.require(:answer).permit(:choice, :id)
end
