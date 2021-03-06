class AddressesController < ApplicationController
  before_action :set_location, except: [:update, :destroy]
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = @location.address
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save 
      redirect_to trip_locations_path[@location.trip_id, @address]
    else
      render :new
    end
  end

  def edit
    if @address.update(address_params)
      redirect_to trip_locations_path[@location, @address]
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to trip_locations_path
  end

  private
  def set_location
    @location = Location.find(params[:location_id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip, :latitude, :longitude)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
