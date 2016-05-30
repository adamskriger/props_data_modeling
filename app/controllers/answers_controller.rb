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
    puts @prop.inspect

    @user = User.find(session[:user_id])
    puts @user.inspect
    @answer = @user.answers.create(answer_params)
    @answer.user_id = @user.id
    puts @answer.inspect

    if @answer.save
      puts "Saved: " + @answer.choice
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

  params.require(:answer).permit(:choice, :id, :prop_id, :prop)
end
