class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update destroy approve reject]

  def index
    @rents = Rent.where(user_id: current_user)
  end

  def show
  end

  def new
    @bike = Bike.find(params[:bike_id])
    @rent = Rent.new
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @rent = Rent.new(rent_params)
    @rent.bike = @bike
    @rent.user = current_user
    @rent.status = "pending"
    @rent.rent_price = Bike.find(params[:bike_id]).price
    if @rent.save
      redirect_to dashboard_path, notice: 'Rent was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def approve
    @rent.update status: 1
    redirect_to owner_rents_rents_path
  end

  def reject
    @rent.update status: 2
    redirect_to owner_rents_rents_path
  end

  def owner_rents
    bikes = Bike.where(user: current_user)
    @rents = Rent.where(bike: bikes)
  end

  def destroy
    @rent.destroy
    redirect_to rents_url, notice: 'Rent was successfully deleted.'
  end

  private

  def set_rent
    @rent = Rent.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :user_id, :bike_id, :rent_price, :status)
  end
end
