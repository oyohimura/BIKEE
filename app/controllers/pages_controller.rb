class PagesController < ApplicationController
  def home
    @bikes = Bike.all
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude
      }
    end
  end

  def dashboard
    @user = current_user
    @rents = Rent.where(user_id: current_user.id)
    @bikes = Bike.where(user_id: current_user.id)
  end

  def profile
    @user = User.find(params[:user_id])
  end
end
