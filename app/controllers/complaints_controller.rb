class ComplaintsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :index, :root]
  before_action :find, only: [:show, :new, :update, :edit]

  def index

    @complaints = Complaint.all

    @Complaints = Complaint.geocoded # returns flats with coordinates

    @markers = @complaints.map do |complaint|
      {
        lat: complaint.latitude,
        lng: complaint.longitude
      }
    end
  end

  def new
    @complaint = Complaint.new
  end

  def show
  end

  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.user = current_user

    if @complaint.save
      redirect_to root_path, notice: 'Your item was successfully created.'
    else
      render :new
   end
  end

  def edit
  end

  def update
    if @complaint.update(complaint_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy

    @complaint.destroy
    redirect_to root_path
  end

 private

  def find
    @complaint = Complaint.find(params[:id])
  end

  def complaint_params
    params.require(:complaint).permit(:category_id, :description, :address, :user_id)
  end
end

end
