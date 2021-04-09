class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @buildings = Building.all.shuffle.first(3)
  end

  def dashboard
    @buildings = Building.all
    @bookings = Booking.where(user_id: current_user.id)
  end
end
