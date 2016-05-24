class CommentsController < ApplicationController

  def create
    @prop = Prop.find(params[:prop_id])
    @comment = @prop.comments.create(comment_params)
    redirect_to prop_path(@prop)
  end

  def destroy
    @prop = Prop.find(params[:prop_id])
    @comment = @prop.comments.find(params[:id])
    @comment.destroy
    redirect_to prop_path(@prop)
  end

end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
