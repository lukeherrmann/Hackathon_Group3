class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :edit]

  def index
    @trips = current_user.trips
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def edit
    render partial: 'form'
  end

  def create 
    @trip = current_user.trips.create(trip_params)

    if @trip.save
      redirect_to trips_path(@trip)
    else
      render :new
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  def random
    @randoms = Trip.random(5)
  end

private
  def set_trip
    @trip = current_user.trips.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date)
  end
end

