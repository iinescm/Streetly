class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end


  # def profile
  #   @bookings = Booking.where(user_id: current_user.id)
  #   @goods = Good.where(user_id: current_user.id)
  #   @user = User.find(current_user.id)

  #   unless @bookings.count == 0
  #     @next_booking = Booking.where(:user_id => current_user.id, :start_date => Date.today).all
  #     @next_booking = Booking.find(@next_booking.ids[0])
  #   end
  # end
end
