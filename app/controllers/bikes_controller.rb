class BikesController < ApplicationController

  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = Bike.all
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def edit
  end

  def create
    @bike = Bike.new(bike_params)

    if @bike.save
      redirect_to @bike, notice: 'Bike was successfully created.'
    else
      render :new
    end
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: 'Bike was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bike.destroy
    redirect_to bikes_url, notice: 'Bike was successfully deleted.'
  end

  private
    def set_bike
      @bike = Bike.find(params[:id])
    end

    def bike_params
      params.require(:bike).permit(:brand, :model, :location, :user_id, :price, :electric)
    end
end
