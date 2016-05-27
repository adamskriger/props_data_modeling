class AnswersController < ApplicationController

  def index

  end

  def new
    @prop = Prop.find(params[:prop_id])
  end

  def create
    @prop = Prop.find(params[:prop_id])
    @answer = @prop.answers.create(params[:choice])

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
