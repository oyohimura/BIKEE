class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]


  def index
    @rents = Rent.all
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
    if @rent.save
      redirect_to rent_path(@rent), notice: 'Rent was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def owner_rents
    @rents = Rent.where(user_id: current_user.id)
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
      params.require(:rent).permit(:start_date, :end_date, :user_id, :bike_id, :rent_price, :approved)
    end

  end
