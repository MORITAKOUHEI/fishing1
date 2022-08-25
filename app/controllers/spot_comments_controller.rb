class SpotCommentsController < ApplicationController
  def create
    spot = Spot.find(params[:spot_id])
    comment = current_user.spot_comments.new(spot_comment_params)
    comment.spot_id = spot.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    SpotComment.find(params[:id]).destroy
    redirect_to spot_path(params[:spot_id])
  end

  private

  def spot_comment_params
    params.require(:spot_comment).permit(:comment)
  end
end