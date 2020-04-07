class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @complaint = Complaint.new
    @complaints= Complaint.all
  end

   def index
      @complaint = Complaint.new
      @complaints = complaints.all
    end

  def profile
    @complaints= Complaint.all
    #@complaints = Complaints.where(user_id: current_user.id)
  end
end
