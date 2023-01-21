class PagesController < ApplicationController
  def home
    @bikes = Bike.all
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
