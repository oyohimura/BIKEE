class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @bikes = Bike.all
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {bike: bike}),
        marker_html: render_to_string(partial: "marker"),
      }
    end
  end

  def dashboard
    @user = current_user
    @owner_rent = Rent.where(bike_id: current_user.bikes.ids)
    @rents = Rent.where(user_id: current_user.id)
    @bikes = Bike.where(user_id: current_user.id)
  end

  def profile
    @user = User.find(params[:user_id])
  end
end
