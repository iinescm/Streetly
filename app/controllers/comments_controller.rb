class CommentsController < ApplicationController
  before_action :find_complaint
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
    flash[:notice] = "You can't like more than once"
  else
    @complaint.comments.create(user_id: current_user.id)
  end
    redirect_to complaint_path(@complaint)
    authorize @complaint
  end

  def destroy
  if !(already_liked?)
    flash[:notice] = "Cannot unlike"
  else
    @comment.destroy
  end
    redirect_to complaint_path(@complaint)
    authorize @complaint
  end

  private
  def find_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  def already_liked?
    Comment.where(user_id: current_user.id, complaint_id:
    params[:complaint_id]).exists?
  end

  def find_like
   @comment = @complaint.comments.find(params[:id])
  end
end
