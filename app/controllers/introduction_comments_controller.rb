class IntroductionCommentsController < ApplicationController

  def create
    introduction = Introduction.find(params[:introduction_id])
    comment = current_user.introduction_comments.new(introduction_comment_params)
    comment.introduction_id = introduction.id
    comment.score = Language.get_data(introduction_comment_params[:comment])
    comment.save
    flash[:notice] = "Comment was successfully created."
    redirect_to request.referrer
  end

  def destroy
    IntroductionComment.find_by(id: params[:id]).destroy
    flash[:notice] = "Comment was successfully deleted."
    redirect_to request.referrer
  end

  private

  def introduction_comment_params
    params.require(:introduction_comment).permit(:comment)
  end

end
