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

#   def update
#     @user = User.find(session[:user_id])
#     @prop = Prop.find(params[:id])
#     @answer = Answer.find(params[:id])
#
#      @prop.update(prop_params)
#      if @user.answers?
#      score_change = @answer.choice == @prop.choice ? 7 : -7
#      User.update_all("score = score + #{score_change}")
#    end
# end


def update
     @user = User.find(session[:user_id])
     @prop = Prop.find(params[:id])
     @answer = Answer.find(params[:id])
     @prop.update(prop_params)

     if Prop.find(params[:id]).choice != 'C'
    User.all.map
       if @answer.choice == @prop.choice && @answer.prop_id == @prop.id
          then
            User.find(answer.user_id).score += ‘5’
          end
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
