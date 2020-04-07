class ComplaintsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :index, :root]
  before_action :find, only: [:show, :edit]

  def index

    @complaints = Complaint.all
    @complaints = Complaint.geocoded # returns flats with coordinates

    @markers = @complaints.map do |complaint|
      {
        lat: complaint.latitude,
        lng: complaint.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { complaint: complaint })

      }
    end

  end

  def list
    @complaints = Complaint.where(user_id: user_session)
    authorize @complaint
  end

   def show
    @complaint = Complaint.find(params[:id])
    authorize @complaint


  end

  def new
    @complaint = Complaint.new
    authorize @complaint


  end

  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.user = current_user
    authorize @complaint


    if @complaint.save
      redirect_to root_path, notice: 'Your item was successfully created.'
    else
      render :new
   end
  end

  def edit
    authorize @complaint

  end

  def update
    find
    if @complaint.update(complaint_params)
      authorize @complaint
      redirect_to root_path
    else
      render :edit
    end
  end

 private

  def find
    @complaint = Complaint.find(params[:id])
  end

  def complaint_params
    params.require(:complaint).permit(:category_id, :description, :address, :user_id, :city_id)
  end
end
