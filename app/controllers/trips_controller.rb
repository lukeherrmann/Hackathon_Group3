class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :edit, :destroy]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def edit
  end

  def create 
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip
    else
      render:edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

private
  def set_trip
    @trip = Trip.find(params(:id))
  end

  def trip_params
    params.require(:trip).permit(:name)
  end
end
