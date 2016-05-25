class PropsController < ApplicationController

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
    if @prop.save
    redirect_to @prop
    else
    render 'new'
    end
  end

  def update
    @prop = Prop.find(params[:id])

    if @prop.update(prop_params)
      redirect_to @prop
    else
      render 'edit'
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
