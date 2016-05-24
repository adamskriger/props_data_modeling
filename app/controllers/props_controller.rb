class PropsController < ApplicationController

  def new
  end

  def create
    @prop = Prop.new(prop_params)

    @prop.save
    redirect_to @prop
  end




end

private
  def prop_params
    params.require(:prop).permit(:title, :text)
  end
